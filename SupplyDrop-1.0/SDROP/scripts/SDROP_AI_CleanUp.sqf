private ["_supplyHeli","_heliSpawnPosition"];
	
	_supplyHeli = _this select 0;
	_heliSpawnPosition = _this select 1;

	//delete crew in heli and delete heli - might be a better way to do this?
	waitUntil {_supplyHeli distance _heliSpawnPosition < 500 };

	{deleteVehicle _x;} forEach crew _supplyHeli;
	deleteVehicle _supplyHeli;