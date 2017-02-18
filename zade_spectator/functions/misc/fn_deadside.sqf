/*
 * Author: Derzade
 * Returns side of dead unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Camera
 *
 * Example:
 * [_unit] call zade_spectator_fnc_deadside;
 *
 * Public: No
 */

params ["_unit"];

{
     private _units = _x select 1;
     private _curside = side (_x select 0);
     {
          if (_unit == _x) exitWith {_curside};
     } forEach _units;
} forEach zade_spectator_deadUnits;

sideUnknown
