private ["_crate"];
	
	_crate = _this select 0;
	_currentTime = diag_tickTime;
	_crateTimout = 900; //15-minutes

	//delete crate after short timeout
	waitUntil {(diag_tickTime - _currentTime) > _crateTimout};
	deleteVehicle _crate;
	
	if (SDROP_Debug) then {
		diag_log text format ["[SDROP]: Player found crate. Crate Deleted after timeout. Restarting new drop."];
	};
	
	//Re-Start supply drop mission
	uiSleep SDROP_MissionTimer;
	[] execVM "\SDROP\missions\SDROP_SupplyDrop.sqf";