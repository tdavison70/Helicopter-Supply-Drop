/*
	Author: tDavison
	Inspiration: blckeagls / A3EAI / VEMF / IgiLoad
	License: Attribution-NonCommercial-ShareAlike 4.0 International
*/

_failed = false;

//Need to calculate if the supply drop was cancelled, based on variable SDROP_SupplyDropFailChance set in init.sqf
if (SDROP_SupplyDropFailChance > 0) then {
	
	_failChance = (floor (random 100) + 1);
	if (_failChance <= SDROP_SupplyDropFailChance) then { _failed = true; };
};

if (_failed) then {
	
	diag_log text format ["[SDROP]: we failed."];
	uiSleep SDROP_MissionTimer;
	[] execVM "\SDROP\missions\SDROP_SupplyDrop.sqf";
	
} else {

	//default helicopter's probability of crashing
	_heliWillCrash = false;

	//Need to calculate if the helicopter will crash, based on variable SDROP_HelicopterCrashChance set in init.sqf
	if (SDROP_HelicopterCrashChance > 0) then {
		_crashChance = (floor (random 100) + 1);
		if (_crashChance <= SDROP_HelicopterCrashChance) then {_heliWillCrash = true};
	};

	// ALTIS - north, south, east, west starting locations for supply helicopter
	// these distances are all oceanic spawns
	_posArray = [[15971.3,25950.5,200],[14727.5,3934.5,200],[26869.5,15454.5,200],[1306.16,14832.8,200]];

	//random supply helicopter spawn
	_heliSpawnPosition = _posArray call bis_fnc_selectrandom;  

	//these variables determine a safe location for the supply crate drops
	//using the helicopter spawn as starting point
	_coords = [_heliSpawnPosition,0,-1,30,0,30,0] call BIS_fnc_findSafePos;

	uiSleep 5;

	//create helicopter and spawn it
	_supplyHeli = createVehicle ["I_Heli_Transport_02_F", _heliSpawnPosition, [], 90, "FLY"];
	_supplyHeli flyInHeight 200;
	_supplyHeli setVehicleLock "LOCKED";
	clearWeaponCargoGlobal _supplyHeli;
	clearMagazineCargoGlobal _supplyHeli;
	clearItemCargoGlobal _supplyHeli;

	//keep heli around until we delete it
	_supplyHeli call EPOCH_server_vehicleInit;
	_supplyHeli call EPOCH_server_setVToken;

	//add pilot (single group) to supply helicopter
	//createVehicleCrew (_supplyHeli);
	_grpPilot = createGroup RESISTANCE;
	_grpPilot setBehaviour "COMBAT";
	_grpPilot setCombatMode "RED";
	_unitPilot = _grpPilot createUnit ["I_helipilot_F", getPos _supplyHeli, [], 0, "FORM"];
	_unitPilot setSkill 1;
	_unitPilot moveInDriver _supplyHeli;

	//Add paratrooper group to supplyHeli
	_grp = objNull;

	if (SDROP_CreateParatrooperAI) then {
		_grpCount = 3;							//default: 3 - this is our minimum number of paratroopers
		_grpReinforce = floor(random 3)+1;		//number of additional paratroopers 1-3
		_grpCount = _grpCount + _grpReinforce;
		
		_grp = createGroup RESISTANCE;
		_grp setBehaviour "COMBAT";
		_grp setCombatMode "RED";
		
		_sniperExists = false;
		_isSniper = false;

		for "_i" from 1 to (_grpCount) do
		{
			// Create Unit(s)
			_unit = _grp createUnit ["I_Soldier_EPOCH", getPos _supplyHeli, [], 0, "FORM"];

			_unit assignAsCargoIndex [_supplyHeli, 1];
			_unit moveInCargo _supplyHeli;
			
			//chance for one unit to be sniper
			if (!_sniperExists) then {
				if (floor(random 100) < 10) then {
					_isSniper = true;
					_sniperExists = true;
					_unit setBehaviour "STEALTH";
				};
			};
			
			// Load the AI Gear
			[_unit,_isSniper] call SDROPLoadAIGear;
			
			//IMPORTANT: reset sniper so all units aren't snipers
			_isSniper = false;
			
			//set skill ranks
			_skillSetArray = [skillsRookie,skillsVeteran,skillsElite];
			
			//apply skills to units - leader will always be elite
			if (count units _grp == _grpCount) then {
				_grp selectLeader _unit;
				[_unit,skillsElite] call SDROPSetUnitSkills;
			} else {
				[_unit,_skillSetArray call bis_fnc_selectrandom] call SDROPSetUnitSkills;
			};

			_unit setRank "Private";
			_unit enableAI "TARGET";
			_unit enableAI "AUTOTARGET";
			_unit enableAI "MOVE";
			_unit enableAI "ANIM";
			_unit enableAI "FSM";

			_unit addEventHandler ["Killed",{ [(_this select 0), (_this select 1)] execVM "\SDROP\scripts\SDROP_AI_Killed.sqf"; }];
			_unit setVariable ["LASTLOGOUT_EPOCH", (diag_tickTime + 14400)];
			
		};
	};

	//set waypoint for helicopter
	_wpPosition =_grpPilot addWaypoint [_coords, 0];
	_wpPosition setWaypointType "MOVE";
	_wpPosition setWaypointSpeed "FULL";
	_wpPosition setWaypointBehaviour "COMBAT";


	if (SDROP_Debug) then {
		_grpNull = isNull _grp;
		_myUnitCount = count units _grp;
		diag_log text format ["[SDROP]: Paratrooper group null? %1, Number of units in group = %2", _grpNull, _myUnitCount];
	};

	//let's get timer to set a timeout for the drop
	_supplyDropStartTime = diag_tickTime;

	if (SDROP_Debug) then {
		diag_log text format ["[SDROP]: Helicopter spawned, and moving to WP"];
	};

	//Announce a drop is inbound to all players
	_title = "Supply Helicopter Inbound!";
	_subTitle = "A chopper carrying survivor equipment has been spotted.";
	[_title,_subTitle] call SDROPBroadcast;

	//if we're crashing, we need to destroy the crew and helicopter, and restart mission params
	if (_heliWillCrash) exitWith {

		//let's let the helicopter get close-ish to drop zone
		_crashDestinationDone = false;
		
		while {true} do {
			if (_supplyHeli distance (getWPPos _wpPosition) < 800) then {
				_crashDestinationDone = true;
				
				//kill the crew - will result in crash
				{_x setDamage 1;} forEach units _grpPilot;
				
				//damage the helicopter - will be destroyed on impact
				_supplyHeli setDamage 0.9;
				
				//Announce the heli got destroyed - optional, comment out below if you don't want to notify players
				_title = "Supply Helicopter Crashed!";
				_subTitle = "Looks like you'll have to wait a while for those supplies.";
				[_title,_subTitle] call SDROPBroadcast;
				
				if (SDROP_CreateParatrooperAI) then {
					if (!isNull _grp && count units _grp >= 1) then {
						{_x setDamage 1;} forEach units _grp;
						_grp = objNull;
					};
				};
			};
			if (_crashDestinationDone) exitWith {};
			uiSleep 5;
		};
		
		//let's recall mission
		uiSleep SDROP_MissionTimer;
		[] execVM "\SDROP\missions\SDROP_SupplyDrop.sqf";
	};

	//Waits until heli gets near the position to drop crate, or if waypoint timeout has been triggered
	_destinationDone = false;
	while {true} do {
		if (_supplyHeli distance (getWPPos _wpPosition) < 400 || (diag_tickTime - _supplyDropStartTime) > 300) then {
			_destinationDone = true;
		};
		if (_destinationDone) exitWith {};
		uiSleep 10;
	};

	//create the parachute and crate
	_crate = createVehicle ["IG_supplyCrate_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	_crate setPos [position _supplyHeli select 0, position _supplyHeli select 1, (position _supplyHeli select 2) - 10];

	//open parachute and attach to crate
	_chute = createVehicle ["I_Parachute_02_F", position _crate, [], 0, "CAN_COLLIDE"];
	_chute call EPOCH_server_vehicleInit;
	_chute call EPOCH_server_setVToken;
	_crate attachTo [_chute, [0, 0, -0.5]];

	//FILL crate with LOOT
	_crateTypeArr = ["food","supplies","weapons","random"];
	_crateType = _crateTypeArr call bis_fnc_selectrandom;

	//Randomize the crate type and fill it
	//same crate every time is boring yo!
	switch (_crateType) do {
		case "food": {
			[_crate] call SDROPLoadLootFood;
		};
		case "supplies": {
			[_crate] call SDROPLoadLootSupplies;
		};
		case "weapons": {
			[_crate] call SDROPLoadLootWeapons;
		};
		case "random": {
			[_crate] call SDROPLoadLootRandom;
		};
		default {
			[_crate] call SDROPLoadLootSupplies;
		};
	};

	// Eject AI from helicopter
	if (SDROP_CreateParatrooperAI) then {
		{ 
			unassignVehicle (_x); 
			(_x) action ["EJECT", _supplyHeli]; 
			uiSleep 1.5; 
		} forEach units _grp;
	};

	//small pause to ensure all items extract
	uiSleep 3;

	//return helicopter to spawn area and clean it up
	//sometimes this doesn't happen, so we check heli loitering later
	_wpHome =_grpPilot addWaypoint [_heliSpawnPosition, 1];
	_wpHome setWaypointType "MOVE";
	_wpHome setWaypointSpeed "FULL";
	_wpHome setWaypointBehaviour "COMBAT";
	_wpHome setWaypointCompletionRadius 800;
	_wpHome setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach units group this;"];

	//detach chute when crate is near the ground
	_crateOnGround = false;
	while {true} do {
		if (getPosATL _crate select 2 > 30) then {
			//attempt to smooth drop for paratroops
			//commented out for performance improvements
			/*if (SDROP_CreateParatrooperAI) then {
				{
					_vel = velocity _x;
					_dirTo = [_x,_crate] call bis_fnc_dirTo;
					_x setDir _dirTo;
					_x setVelocity [
						(_vel select 0) + (sin _dirTo * 0.2),
						(_vel select 1) + (cos _dirTo * 0.2),
						(_vel select 2)
					];
				} forEach units _grp;
			};*/
			uiSleep 5;
		};

		if (getPosATL _crate select 2 < 4) then {
			_crateOnGround = true;
			detach _crate;
		};
		if (_crateOnGround) exitWith {};
		uiSleep 1;
	};

	//delete the chute for clean-up purposes
	deleteVehicle _chute;

	//see if crate is in the drink
	_crateIsInWater = surfaceIsWater position _crate;

	if (_crateIsInWater) exitWith {
		
		//crate was dropped in water, re-start mission, do some cleanup
		deleteVehicle _crate;
		
		//remove all AI or they just swim until death
		if (SDROP_CreateParatrooperAI) then {
			if (!isNull _grp && count units _grp >= 1) then {
				{deleteVehicle _x;} forEach units _grp;
				_grp = objNull;
			};
		};
		
		if (SDROP_Debug) then {
			diag_log text format ["[SDROP]: Crate dropped in water - restarting."];
		};
		
		uiSleep SDROP_MissionTimer;
		[] execVM "\SDROP\missions\SDROP_SupplyDrop.sqf";
	};

	if (SDROP_CreateParatrooperAI) then {
		[_grp, _crate] call SDROPSetAIWaypoints;
	};

	//we don't want to give away crates exact position, so we'll generate an offset in meters (default 200)
	_markerOffset = [(position _crate select 0) + floor (random 200), (position _crate select 1) + floor (random 200), position _crate select 2];

	//create marker at supply crate's landing zone (NOTE: only an approximation of where crate will be, and crate could be slightly outside the LZ)
	_marker = createMarker ["SupplyDropMarker", _markerOffset];
	_marker setMarkerSize [500,500];
	_marker setMarkerBrush "Horizontal";
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerColor "ColorCIV";

	//If you decide to use the marker below, comment out marker above
	//This marker spawns on the crate - giving away the crate's exact position
	//_marker = createMarker ["SupplyDropMarker", getPos _crate ];
	//_marker setMarkerType "mil_objective";
	//_marker setMarkerColor "ColorYellow";

	//pop smoke shell and chemLight yellow at crate
	_smoke = createVehicle ["SmokeShellPurple", [position _crate select 0, (position _crate select 1) + 1, position _crate select 2], [], 0, "NONE"];
	_chemLight = createVehicle ["Chemlight_yellow", [position _crate select 0, (position _crate select 1) + 2, position _crate select 2], [], 0, "NONE"];

	//get time the crate landed so we can time it
	_crateDropStartTime = diag_tickTime;

	if (SDROP_Debug) then {
		diag_log text format ["[SDROP]: Crate landed. Starting Crate de-spawn timer"];
	};

	//announce to players the eagle has landed
	_title = "Supply Crate Delivered!";
	_subTitle = "Check your map for the drop zone, and go get those supplies!";
	[_title,_subTitle] call SDROPBroadcast;

	//check to see if helicopter is loitering (it should be long gone by now)
	//hate to do this, but have to just delete the vehicle as it refuses to comply with waypoint
	_heliLoitering = true;
	while {_heliLoitering} do {
		if (_supplyHeli distance (getWPPos _wpPosition) < 400 && !isNull _supplyHeli) then {
			diag_log text format ["[SDROP]: Deleted supply helicopter for loitering"];
			deleteWaypoint [_grpPilot, 0];
			deleteWaypoint [_grpPilot, 1];
			{deleteVehicle _x;} forEach units _grpPilot;
			deleteVehicle _supplyHeli;
		} else {
			_heliLoitering = false;
		};
		uiSleep 5;
	};

	//Waits until player gets near the crate to end mission OR timeout occurred
	_crateFound = false;
	_crateTimedOut = false;
	while {true} do {
		if ((diag_tickTime - _crateDropStartTime) > SDROP_CrateTimeout) then {
			_crateTimedOut = true;
		};
		if ({isPlayer _x && _x distance _crate < 10} count playableUnits > 0) then {
			_crateFound = true;
		};
		if (_crateFound || _crateTimedOut) exitWith {};
		uiSleep 15;
	};

	//delete marker, smoke and chemLight
	deleteMarker "SupplyDropMarker";
	deleteVehicle _smoke;
	deleteVehicle _chemLight;

	//clean-up the crate after time-out has been reached, and no player found the crate
	if (_crateTimedOut) exitWith {

		deleteVehicle _crate;
		
		//remove all AI
		if (SDROP_CreateParatrooperAI) then {
				if (!isNull _grp && count units _grp >= 1) then {
				{deleteVehicle _x;} forEach units _grp;
				_grp = objNull;
			};
		};
		
		if (SDROP_Debug) then {
			diag_log text format ["[SDROP]: No players found the crate. Deleted crate"];
		};
		
		//Re-Start supply drop mission
		uiSleep SDROP_MissionTimer;
		[] execVM "\SDROP\missions\SDROP_SupplyDrop.sqf";
		
	};

	//player got within 10m of crate, so lets clean it up after a short delay
	if (!isNull _crate && _crateFound) then {
		[_crate,_grp] execVM "\SDROP\scripts\SDROP_Crate_CleanUp.sqf";
	}
};