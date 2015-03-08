/*
	Author: tDavison
	Inspiration: blckeagls / A3EAI / VEMF / IgiLoad
	License: Attribution-NonCommercial-ShareAlike 4.0 International
*/

if (!isDedicated) exitWith {};

// Check if another version is running
if (!isNil("SDROPActive")) exitWith {};

//should prevent this script from running more than once
SDROPActive = true;
publicVariable "SDROPActive";


SDROP_Debug = true;					//Set to false if you do NOT want logs added to your RPT - used mostly for testing/diagnosis of issues
SDROP_CreateParatrooperAI = true;	//Set to false if you do NOT want AI to drop with the crate
SDROP_MissionTimer = 900;			//mission timer - time taken for new helicopter to arrive / conditional (default: 900, which is 15 minutes real-time)
SDROP_CrateTimeout = 1800;			//This is the NON-LOOTED crate clean-up timer - (default is 1800 which is half-hour real-time)
SDROP_SupplyDropFailChance = 0;		//Change probability of supply drop - enter chance as whole number from 1-100 (default 0)
SDROP_HelicopterCrashChance = 0;	//Change probability of helicopter crashing - enter chance as whole number from 1-100 (default 0)


if (SDROP_Debug) then {
	diag_log text format ["[SDROP]: Starting Supply Drop Mission Framework."];
};

//Load all SDROP functions
//Edit the file below to define loot tables for crates
//and to define skills of AI - these guys are really tough by default

call compile preprocessFileLineNumbers "\SDROP\scripts\SDROP_Functions.sqf";


//Start supply drop mission -- NO EDITING BEYOND THIS POINT PLEASE
uiSleep SDROP_MissionTimer;
[] execVM "\SDROP\missions\SDROP_SupplyDrop.sqf";