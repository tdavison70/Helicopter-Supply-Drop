/*
	Author: tDavison
	Inspiration: blckeagls / A3EAI / VEMF / IgiLoad
	License: Attribution-NonCommercial-ShareAlike 4.0 International
*/

if (!isServer) exitWith {};

//mission timer - how often should supply drops happen (default: 600)
//NOTE: This won't get triggered unless crate is unreachable or someone finds crate
SDROPMissionTimer = 600;

//declare log entry for mission framework
diag_log text format ["[SDROP]: Starting Supply Drop Mission Framework"];

//Change probability of supply drop - enter percentage as whole number from 1-100 (default 0)
//example: if you change it to 30, then there is a 30% chance the supply drop won't get called - it will attempt it again based on timer above
SDROPSupplyDropFailChance = 0;

//Change probability of helicopter crashing - enter percentage as whole number from 1-100 (default 0)
//example: if you enter 50, then there is a 50% chance the helicopter will crash on its way to LZ
SDROPHelicopterCrashChance = 0;

//Defines LOOT types and gets added to the drop crate
SDROPLoadLootFood = {
	private["_crate"];
	_crate = _this select 0;
	
	//empty crate first
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	
	//fill the crate with FOOD & CLOTHING
	_crate addMagazineCargoGlobal ["ItemSodaRbull",2];
	_crate addMagazineCargoGlobal ["ItemSodaOrangeSherbet",2];
	_crate addMagazineCargoGlobal ["ItemSodaPurple",2];
	_crate addMagazineCargoGlobal ["ItemSodaMocha",2];
	_crate addMagazineCargoGlobal ["ItemSodaBurst",2];
	_crate addMagazineCargoGlobal ["FoodMeeps",2];
	_crate addMagazineCargoGlobal ["FootSnooter",2];
	_crate addMagazineCargoGlobal ["FoodWalkNSons",2];
	_crate addMagazineCargoGlobal ["water_epoch",4];
	_crate addMagazineCargoGlobal ["ItemCoolerE",4];
	_crate addMagazineCargoGlobal ["SweetCorn_EPOCH",4];
	_crate addMagazineCargoGlobal ["WhiskeyNoodle",6];
	_crate addMagazineCargoGlobal ["SnakeMeat_EPOCH",1];
	_crate addMagazineCargoGlobal ["CookedRabbit_EPOCH",2];
	_crate addMagazineCargoGlobal ["CookedChicken_EPOCH",2];
	_crate addMagazineCargoGlobal ["CookedGoat_EPOCH",2];
	_crate addMagazineCargoGlobal ["CookedSheep_EPOCH",2];
	_crate addItemCargoGlobal ["U_O_CombatUniform_ocamo",1];
	_crate addItemCargoGlobal ["U_O_GhillieSuit",1];
	_crate addItemCargoGlobal ["U_O_Wetsuit",1];
	_crate addItemCargoGlobal ["U_OG_Guerilla1_1",1];
	_crate addItemCargoGlobal ["U_OG_Guerilla2_1",1];
	_crate addItemCargoGlobal ["U_OG_Guerilla3_1",1];
	_crate addItemCargoGlobal ["U_OrestesBody",1];
	_crate addItemCargoGlobal ["U_Wetsuit_uniform",1];
	_crate addItemCargoGlobal ["U_Ghillie1_uniform",1];
	_crate addBackpackCargoGlobal ["B_Carryall_ocamo",2];
};

SDROPLoadLootSupplies = {
	private["_crate"];
	_crate = _this select 0;
	
	//empty crate first
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	
	//fill the crate with SUPPLIES
	_crate addMagazineCargoGlobal ["CinderBlocks",8];
	_crate addMagazineCargoGlobal ["jerrycan_epoch",3];
	_crate addMagazineCargoGlobal ["CircuitParts",4];
	_crate addMagazineCargoGlobal ["ItemCorrugatedLg",1];
	_crate addMagazineCargoGlobal ["ItemCorrugated",4];
	_crate addMagazineCargoGlobal ["ItemMixOil",2];
	_crate addMagazineCargoGlobal ["MortarBucket",6];
	_crate addMagazineCargoGlobal ["PartPlankPack",4];
	_crate addMagazineCargoGlobal ["ItemLockbox",1];
	_crate addMagazineCargoGlobal ["FAK",6];
	_crate addMagazineCargoGlobal ["VehicleRepair",2];
	_crate addMagazineCargoGlobal ["Towelette",4];
	_crate addMagazineCargoGlobal ["HeatPack",2];
	_crate addMagazineCargoGlobal ["ColdPack",2];
	_crate addMagazineCargoGlobal ["Pelt_EPOCH",2];
	_crate addWeaponCargoGlobal ["MultiGun",2];
	_crate addMagazineCargoGlobal ["Heal_EPOCH",2];
	_crate addMagazineCargoGlobal ["Repair_EPOCH",1];
	_crate addMagazineCargoGlobal ["EnergyPack",4];
	_crate addMagazineCargoGlobal ["EnergyPackLg",1];
	_crate addBackpackCargoGlobal ["B_Carryall_oucamo",1];
	_crate addBackpackCargoGlobal ["B_FieldPack_cbr",1];
	_crate addBackpackCargoGlobal ["B_TacticalPack_ocamo",1];
};

SDROPLoadLootWeapons = {
	private["_crate"];
	_crate = _this select 0;
	
	//empty crate first
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	
	//fill the crate with WEAPONS and AMMO
	_crate addWeaponCargoGlobal ["srifle_DMR_01_F",1];
	_crate addMagazineCargoGlobal ["20Rnd_762x51_Mag",4];
	_crate addWeaponCargoGlobal ["arifle_Mk20_F",1];
	_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag",4];
	_crate addWeaponCargoGlobal ["arifle_MX_Black_F",1];
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer",4];
	_crate addWeaponCargoGlobal ["M249_EPOCH",1];
	_crate addMagazineCargoGlobal ["200Rnd_556x45_M249",2];
	_crate addWeaponCargoGlobal ["srifle_LRR_SOS_F",1];
	_crate addMagazineCargoGlobal ["7Rnd_408_Mag",3];
	_crate addItemCargoGlobal ["optic_Arco",1];
	_crate addItemCargoGlobal ["optic_SOS",1];
	_crate addItemCargoGlobal ["optic_Aco",1];
	_crate addItemCargoGlobal ["optic_LRPS",1];
	_crate addItemCargoGlobal ["Muzzle_snds_H",1];
	_crate addItemCargoGlobal ["Muzzle_snds_M",1];
	_crate addItemCargoGlobal ["Muzzle_snds_B",1];
	_crate addItemCargoGlobal ["ItemCompass",4];
	_crate addItemCargoGlobal ["ItemGPS",4];
	_crate addItemCargoGlobal ["EpochRadio0",4];
	_crate addItemCargoGlobal ["ItemWatch",4];
	_crate addItemCargoGlobal ["V_7_EPOCH",1];
	_crate addItemCargoGlobal ["V_10_EPOCH",1];
	_crate addItemCargoGlobal ["V_13_EPOCH",1];
	_crate addItemCargoGlobal ["V_14_EPOCH",1];
	_crate addItemCargoGlobal ["V_15_EPOCH",1];
	_crate addItemCargoGlobal ["V_37_EPOCH",1];
	_crate addItemCargoGlobal ["V_38_EPOCH",1];
	_crate addMagazineCargoGlobal ["HandGrenade",2];
	_crate addMagazineCargoGlobal ["MiniGrenade",2];
	_crate addBackpackCargoGlobal ["B_FieldPack_ocamo",2];
};

SDROPLoadLootRandom = {
	[_crate] call SDROPRandomLoot;
};

// Crate Blacklist - These are items that should NOT be in random crate - should eliminate most BE filter issues (may need more testing)
SDROPCrateBlacklist = [
	"DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "ATMine_Range_Mag",
	"ClaymoreDirectionalMine_Remote_Mag", "APERSMine_Range_Mag",
	"APERSBoundingMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag",
	"APERSTripMine_Wire_Mag", "NVG_EPOCH", "NVGoggles_OPFOR", "NVGoggles_INDEP",
	"FirstAidKit", "Medikit", "ToolKit", "optic_DMS"
];

SDROPRandomLoot = {
	private ["_crate","_var","_tmp","_kindOf","_report","_cAmmo"];
	
	_crate = _this select 0;
	
	// Empty Crate
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal  _crate;
	clearItemCargoGlobal _crate;
	
	SDROPLootList = [];
		// Generate Loot
		{
			_tmp = (getArray(_x >> 'items'));
			for "_z" from 0 to ((count(_tmp))-1) do {
				SDROPLootList = SDROPLootList + [((_tmp select _z) select 0)];
			};
		} forEach ("configName _x != 'Uniforms' && configName _x != 'Headgear'" configClasses (configFile >> "CfgLootTable"));
	
	_report = [];
	// Load Random Loot Amount
	for "_i" from 1 to ((floor(random 10)) + 10) do {
		_var = (SDROPLootList call BIS_fnc_selectRandom);
		
		if (!(_var in SDROPCrateBlacklist)) then {
			switch (true) do
			{
				case (isClass (configFile >> "CfgWeapons" >> _var)): {
					_kindOf = [(configFile >> "CfgWeapons" >> _var),true] call BIS_fnc_returnParents;
					if ("ItemCore" in _kindOf) then {
						_crate addItemCargoGlobal [_var,1];
					} else {
						_crate addWeaponCargoGlobal [_var,1];
						
						_cAmmo = [] + getArray (configFile >> "cfgWeapons" >> _var >> "magazines");
						{
							if (isClass(configFile >> "CfgPricing" >> _x)) exitWith {
								_crate addMagazineCargoGlobal [_x,2];
							};
						} forEach _cAmmo;
					};
				};
				case (isClass (configFile >> "cfgMagazines" >> _var)): {
					_crate addMagazineCargoGlobal [_var,1];
				};
				case ((getText(configFile >> "cfgVehicles" >> _var >>  "vehicleClass")) == "Backpacks"): {
					_crate addBackpackCargoGlobal [_var,1];
				};
				default {
					_report = _report + [_var];
				};
			};
		};
	};
	
	if ((count _report) > 0) then {
		diag_log text format ["[SDROP]: LoadLoot: <Unknown> %1", str _report];
	};
};

SDROPBroadcast = {
	private ["title","subTitle"];
	
	_title = _this select 0;
	_subTitle = _this select 1;
	
	_alertMsg = "<t color='#FFCC00' size='1.0' font='PuristaSemibold' shadow='1' shadowColor='#000000' align='center'>" + _title + "</t>";
	_alertMsg = _alertMsg + "<br /><t color='#FFFFFF' size='0.9' font='PuristaLight' shadow='0' align='center'>" + _subTitle + "</t>";
	
	[_alertMsg] execVM "\SDROP\scripts\SDROP_Alert.sqf";
};


//Start supply drop mission -- NO EDITING
sleep SDROPMissionTimer;
[] execVM "\SDROP\missions\SDROP_SupplyDrop.sqf";