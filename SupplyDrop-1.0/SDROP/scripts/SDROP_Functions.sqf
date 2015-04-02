// PLAYER DEFINED LOOT TABLES - EDIT ITEMS BELOW FOR CRATES
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
	"APERSTripMine_Wire_Mag", "NVGoggles_OPFOR", "NVGoggles_INDEP",
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
	 {SDROPLootList = SDROPLootList + [ ( _x select 0 ) select 0 ];} forEach (_tmp);
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
	private ["_title","_subTitle"];
	
	_title = _this select 0;
	_subTitle = _this select 1;
	
	_alertMsg = "<t color='#FFCC00' size='1.0' font='PuristaSemibold' shadow='1' shadowColor='#000000' align='center'>" + _title + "</t>";
	_alertMsg = _alertMsg + "<br /><t color='#FFFFFF' size='0.9' font='PuristaLight' shadow='0' align='center'>" + _subTitle + "</t>";
	
	[_alertMsg] execVM "\SDROP\scripts\SDROP_Alert.sqf";
};

SDROPSetAIWaypoints = {
	private ["_grp","_crate"];
	
	_grp = _this select 0;
	_crate = _this select 1;
	_cratePos = getPos _crate;
	
	_wpPatrolGrid = [
		[(_cratePos select 0)+20, (_cratePos select 1), 0],
		[(_cratePos select 0), (_cratePos select 1)+20, 0],
		[(_cratePos select 0)-20, (_cratePos select 1), 0],
		[(_cratePos select 0), (_cratePos select 1)-20, 0]
	];
	
	for "_i" from 0 to ((count _wpPatrolGrid)-1) do {
		_wp = _grp addWaypoint [(_wpPatrolGrid select _i), 0];
		_wp setWaypointType "SAD";
		_wp setWaypointBehaviour "COMBAT";
		_wp setWaypointCompletionRadius 10;
	};
	
	_cycle = _grp addWaypoint [_cratePos, 20];
	_cycle setWaypointType "CYCLE";
	_cycle setWaypointBehaviour "COMBAT";
	_cycle setWaypointCompletionRadius 10;
};

SDROPLoadAIGear = {
	private ["_unit","_isSniper","_prim","_seco","_pAmmo","_hAmmo"];
	
	_unit = _this select 0;
	_isSniper = _this select 1;
	
	if (!isNull _unit) then {
		removeAllWeapons _unit;
		{_unit removeMagazine _x;} forEach (magazines _unit);
		removeAllItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeGoggles _unit;
		removeHeadGear _unit;
		
		if (_isSniper) then {
			// Add Sniper Clothing
			_unit forceAddUniform ("U_O_GhillieSuit");
			_unit addHeadGear (SDROPHeadgearList call BIS_fnc_selectRandom);
			_unit addVest (SDROPVestList call BIS_fnc_selectRandom);
			
			// Add Sniper Weapons & Ammo (default M104 with LR scope and ammo)
			_prim = "srifle_LRR_SOS_F";
			_seco = SDROPPistolsList call BIS_fnc_selectRandom;
		} else {
			//clothing
			_unit forceAddUniform (SDROPUniformList call BIS_fnc_selectRandom);
			_unit addHeadGear (SDROPHeadgearList call BIS_fnc_selectRandom);
			_unit addVest (SDROPVestList call BIS_fnc_selectRandom);
			
			//weapons & Ammo
			_prim = SDROPRiflesList call BIS_fnc_selectRandom;
			_seco = SDROPPistolsList call BIS_fnc_selectRandom;
		};
		
		// Give unit parachute
		_unit addBackpack "B_Parachute";
		
		//NV Goggles for night drops
		if (SunOrMoon < 1) then {
			_unit addItem "NVG_EPOCH";
			_unit assignItem "NVG_EPOCH";
		};
		
		//Gotta get paid yo!
		_kryptoAmount = floor (random 300) +1;
		_unit setVariable ["krypto", _kryptoAmount];
		
		_pAmmo = [] + getArray (configFile >> "cfgWeapons" >> _prim >> "magazines");
		{
			if (isClass(configFile >> "CfgPricing" >> _x)) exitWith {
				_unit addMagazine _x;
				_unit addMagazine _x;
			};
		} forEach _pAmmo;
		
		_hAmmo = [] + getArray (configFile >> "cfgWeapons" >> _seco >> "magazines");
		{
			if (isClass(configFile >> "CfgPricing" >> _x)) exitWith {
				_unit addMagazine _x;
				_unit addMagazine _x;
			};
		} forEach _hAmmo;
		
		_unit addWeapon _prim;
		_unit selectWeapon _prim;
		_unit addWeapon _seco;

	};
};

SDROPHeadgearList = [
	"H_39_EPOCH","H_40_EPOCH","H_41_EPOCH","H_42_EPOCH","H_43_EPOCH","H_44_EPOCH","H_45_EPOCH","H_46_EPOCH","H_47_EPOCH","H_48_EPOCH",
	"H_49_EPOCH","H_50_EPOCH","H_51_EPOCH","H_52_EPOCH","H_53_EPOCH","H_54_EPOCH","H_55_EPOCH","H_56_EPOCH","H_57_EPOCH","H_58_EPOCH",
	"H_59_EPOCH","H_60_EPOCH","H_61_EPOCH","H_62_EPOCH","H_63_EPOCH","H_64_EPOCH","H_65_EPOCH","H_66_EPOCH","H_67_EPOCH","H_68_EPOCH",
	"H_69_EPOCH","H_70_EPOCH","H_74_EPOCH","H_75_EPOCH","H_76_EPOCH","H_77_EPOCH","H_86_EPOCH","H_87_EPOCH","H_88_EPOCH","H_89_EPOCH",
	"H_90_EPOCH","H_91_EPOCH","H_92_EPOCH", "H_Beret_blk", "H_Beret_red", "H_Beret_grn"
];

SDROPUniformList = [
	"U_O_CombatUniform_ocamo", "U_O_PilotCoveralls", "U_OG_Guerilla1_1", "U_OG_Guerilla2_1", "U_OG_Guerilla2_3", "U_IG_leader",
	"U_OG_Guerilla3_1", "U_OG_Guerilla3_2", "U_OG_leader", "U_C_WorkerCoveralls", "U_I_CombatUniform_tshirt", "U_I_OfficerUniform",
	"U_CamoRed_uniform", "U_CamoBrn_uniform", "U_CamoBlue_uniform", "U_Camo_uniform", "U_O_CombatUniform_oucamo", "U_I_CombatUniform_shortsleeve"
];

SDROPVestList = [
	"V_1_EPOCH","V_2_EPOCH","V_3_EPOCH","V_4_EPOCH","V_5_EPOCH","V_6_EPOCH","V_7_EPOCH","V_8_EPOCH","V_9_EPOCH","V_10_EPOCH",
	"V_11_EPOCH","V_12_EPOCH","V_13_EPOCH","V_14_EPOCH","V_15_EPOCH","V_16_EPOCH","V_17_EPOCH","V_18_EPOCH","V_19_EPOCH","V_20_EPOCH",
	"V_21_EPOCH","V_22_EPOCH","V_23_EPOCH","V_24_EPOCH","V_25_EPOCH","V_26_EPOCH","V_27_EPOCH","V_28_EPOCH","V_29_EPOCH","V_30_EPOCH",
	"V_31_EPOCH","V_32_EPOCH","V_33_EPOCH","V_34_EPOCH","V_35_EPOCH","V_36_EPOCH","V_37_EPOCH","V_38_EPOCH","V_39_EPOCH","V_40_EPOCH"
];

SDROPRiflesList = [
	"srifle_EBR_F","srifle_DMR_01_F","arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F","arifle_MX_F",
	"arifle_MX_GL_F","arifle_MXM_F","arifle_SDAR_F","arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_Mk20_F",
	"arifle_Mk20C_F","arifle_Mk20_GL_F","arifle_Mk20_plain_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_plain_F","SMG_01_F",
	"SMG_02_F","hgun_PDW2000_F","arifle_MXM_Black_F","arifle_MX_GL_Black_F","arifle_MX_Black_F","arifle_MXC_Black_F","Rollins_F",
	"LMG_Mk200_F","arifle_MX_SW_F","LMG_Zafir_F","arifle_MX_SW_Black_F","m249_EPOCH","m249Tan_EPOCH",
	"m16_EPOCH","m16Red_EPOCH","M14_EPOCH","M14Grn_EPOCH","m4a3_EPOCH","AKM_EPOCH"
];

SDROPPistolsList = [
	"hgun_ACPC2_F","hgun_Rook40_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","ruger_pistol_epoch",
	"1911_pistol_epoch","hgun_Pistol_Signal_F"
];

// Set AI Skills
SDROPSetUnitSkills = {
	private ["_unit","_skillSetArray"];
	
	_unit = _this select 0;
	_skillSetArray = _this select 1;
	
	{
		_unit setSkill [(_x select 0),(_x select 1)];
		//diag_log text format ["[SDROP]: Skill: %1:%2", (_x select 0),(_x select 1)];
	} forEach _skillSetArray;
};

//SkillSets - endurance removed from Arma 3
skillsRookie = [
["aimingAccuracy",0.4],
["aimingShake",0.3],
["aimingSpeed",0.3],
["spotDistance",0.3],
["spotTime",0.3],
["courage",0.4],
["reloadSpeed",0.6],
["commanding",0.6],
["general",1.0]
];

skillsVeteran = [
["aimingAccuracy",0.6],
["aimingShake",0.6],
["aimingSpeed",0.6],
["spotDistance",0.6],
["spotTime",0.6],
["courage",0.6],
["reloadSpeed",0.7],
["commanding",0.8],
["general",1.0]
];

skillsElite = [
["aimingAccuracy",0.8],
["aimingShake",0.75],
["aimingSpeed",0.7],
["spotDistance",0.8],
["spotTime",0.8],
["courage",1.0],
["reloadSpeed",0.8],
["commanding",1.0],
["general",1.0]
];

if (SDROP_Debug) then {
	diag_log text format ["[SDROP]: Functions loaded. Starting supply drop timer."];
};
