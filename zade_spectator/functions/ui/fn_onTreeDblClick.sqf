/*
 * Author: Derzade
 * Triggerd by the 'TreeDblClick'-EH of the units tree
 *
 * Arguments:
 * 0: Tree <CONTROL>
 * 1: Path <ARRAY>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_onTreeDblClick;
 *
 * Public: No
 */
params ["_ctrl","_path"];

if (count _path isEqualTo 1) exitWith {};

private _unit = zade_spectator_treeUnits select (_ctrl tvValue _path);

[_unit] call zade_spectator_fnc_switchTarget;
