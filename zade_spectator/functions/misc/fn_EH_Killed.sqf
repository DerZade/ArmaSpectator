/*
 * Author: Derzade
 * Triggers when spectetable unit dies
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * n/a
 *
 * Public: No
 */
params ["_unit"];

private _group = group _unit;

//push unit into variable
if (isNil "zade_spectator_dead") then {zade_spectator_dead = [];};
private _index = [zade_spectator_dead,_group] call zade_spectator_fnc_findInPairs;
if (_index isEqualTo -1) then {
     zade_spectator_dead pushBack [_group,[_unit]];
} else {
     (zade_spectator_dead select _index select 1) pushBack _unit;
};

publicVariable "zade_spectator_dead";

//update the unit tree of all spectators
[[[], {call zade_spectator_fnc_loadUnitsTree}], "BIS_fnc_call", zade_specator_spectators] call BIS_fnc_MP;
