//This script sends Message Information to all players
SDROP_Alert = _this select 0;
{
	(owner _x) publicVariableClient "SDROP_Alert";
} foreach playableUnits;