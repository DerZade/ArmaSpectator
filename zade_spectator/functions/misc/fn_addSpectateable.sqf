/*
 * Author: Derzade
 * Add unit as spectateable
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Add (true) / remove (false) <BOOL> (OPTIONAL Def.: true)
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [player] call zade_spectator_fnc_addSpectateable;
 *
 * Public: No
 */
params ["_unit",["_add", true]];


if (_add) then {
     //exit if unit already is spectateable
     if (_unit in zade_spectator_spectateableUnits) exitWith {};

     private _id1 = _unit addEventHandler ["Killed",zade_spectator_fnc_EH_Killed];
     private _id2 = _unit addEventHandler ["GetInMan",zade_spectator_fnc_EH_GetInMan];
     private _id3 = _unit addEventHandler ["GetOutMan",zade_spectator_fnc_EH_GetOutMan];
     _unit setVariable ["zade_spectator_EHs", [_id1,_id2,_id3], true];
     _unit setVariable ["zade_spectator_name", (name _unit), true];

     zade_spectator_spectateableUnits pushBack _unit;
     publicVariable "zade_spectator_spectateableUnits";
} else {
     //exit if unit isn't in spectateable
     if !(_unit in zade_spectator_spectateableUnits) exitWith {};

     _unit removeEventHandler ["Killed",(_unit getVariable "zade_spectator_EHs") select 0];
     _unit removeEventHandler ["GetInMan",(_unit getVariable "zade_spectator_EHs") select 1];
     _unit removeEventHandler ["GetOutMan",(_unit getVariable "zade_spectator_EHs") select 2];

     _unit setVariable ["zade_spectator_name", nil, true];

     zade_spectator_spectateableUnits deleteAt (zade_spectator_spectateableUnits find _unit);
     publicVariable "zade_spectator_spectateableUnits";

     //for all spectators: load units tree and switch target if cur target is removed unit
     [[[_unit],{[] call zade_spectator_fnc_loadUnitsTree; if (zade_spectator_target isEqualTo (_this select 0)) then {[([] call zade_spectator_fnc_allUnits) select 0] call zade_spectator_fnc_switchTarget;};}],"BIS_fnc_call",zade_specator_spectators] call BIS_fnc_MP;
};
