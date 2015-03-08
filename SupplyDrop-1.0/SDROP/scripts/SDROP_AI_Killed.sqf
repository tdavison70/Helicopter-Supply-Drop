private ["_unit","_killer"];

_unit = _this select 0;
_killer = _this select 1;

//promote another unit if leader was killed
if ((count (units group _unit)) > 1) then {
	if ((leader group _unit) == _unit) then {
		_grpUnits = units group _unit;
		_grpUnits = _grpUnits - [_unit];
		(group _unit) selectLeader (_grpUnits call BIS_fnc_selectRandom);
	};
};

if (isPlayer _killer) then {
	{
		if ((_x distance _killer) <= 500) then {
			_x reveal [_killer, 4.0];
		};
	} forEach (units group _unit);
	
	//Leader is so brave!
	if (((leader group _unit) distance _killer) <= 200) then {
		(group _unit) move (getPos _killer);
	};
	
	//drop some money yo!
	_moneyChance = floor (random 100);

	if(_moneyChance < 30) then {
		_kryptoPos = getPosATL _unit;
		_kryptoAmount = _unit getVariable ["krypto", 0];
		_kryptoDevice = createVehicle ["Land_MPS_EPOCH",_kryptoPos,[],1.5,"CAN_COLLIDE"];
		_kryptoDevice setVariable ["Crypto",_kryptoAmount,true];
		_unit setVariable ["KryptoDevice",_kryptoDevice];
	};
};

//clean-up / de-spawn timer
_unit spawn {
	waitUntil{!alive _this};
	uiSleep 600;
	deleteVehicle _this;
};