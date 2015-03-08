private ["_crate","_grp"];
	
	_crate = _this select 0;
	_grp = _this select 1;
	_currentTime = diag_tickTime;
	_crateTimout = 900; //15-minutes

	//delete crate after short timeout
	_crateTimerExpired = false;
	while {true} do {
		if ((diag_tickTime - _currentTime) > _crateTimout) then {
			_crateTimerExpired = true;
			deleteVehicle _crate;
	
			if (SDROP_CreateParatrooperAI) then {
					if (!isNull _grp && count units _grp >= 1) then {
					{deleteVehicle _x;} forEach units _grp;
					_grp = objNull;
				};
			};
			
			if (SDROP_Debug) then {
				diag_log text format ["[SDROP]: Player found crate. Crate Deleted after timeout. Restarting new drop."];
			};
		};
		if (_crateTimerExpired) exitWith {};
		uiSleep 15;
	};
	
	
	//Re-Start supply drop mission
	uiSleep SDROP_MissionTimer;
	[] execVM "\SDROP\missions\SDROP_SupplyDrop.sqf";