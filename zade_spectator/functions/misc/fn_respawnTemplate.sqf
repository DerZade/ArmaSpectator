

params ["_oldUnit","_killer"];

private _target = nil;
if (_killer in ([] call zade_spectator_fnc_allUnits)) then {
     [_killer] call zade_spectator_fnc_enter;
     _target = _killer;
} else {
     [] call zade_spectator_fnc_enter;
};
systemChat str _this;


if (zade_spectator_camMode isEqualTo "FREECAM" and !(isNil "_target")) then {
     private _pos = [_oldUnit, 5, ([_oldUnit, _killer] call BIS_fnc_relativeDirTo) -180] call BIS_fnc_relPos;
     _pos set [2, 1.5];

     zade_spectator_camera setPos _pos;

     zade_spectator_camera camSetTarget zade_spectator_target;
     zade_spectator_camera  camCommit 0;

     zade_spectator_camera camSetTarget objNull;
     zade_spectator_camera  camCommit 0;
};

false;
