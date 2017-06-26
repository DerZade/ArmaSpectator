/*
 * Author: Derzade
 * Triggers when spectetable gets out of vehicle
 *
 * Arguments:
 * n/a
 *
 * Return Value:
 * NONE
 *
 * Example:
 * n/a
 *
 * Public: No
 */
params ["_unit","_pos","_vehicle","_turret"];

//update the unit tree of all spectators
private _code = {
     params ["_unit"];
     if ((_unit isEqualTo zade_spectator_target) and (zade_spectator_cammode isEqualTo "EXTERNAL")) then {
          zade_spectator_camera camSetTarget zade_spectator_target;
     };
     call zade_spectator_fnc_loadUnitsTree;
};
[[[_unit], _code] ,"BIS_fnc_call", zade_specator_spectators] call BIS_fnc_MP;
