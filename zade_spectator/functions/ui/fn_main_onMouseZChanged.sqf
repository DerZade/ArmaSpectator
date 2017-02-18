/*
 * Author: Derzade
 * onMouseZChanged-EH
 *
 * Arguments:
 * 0: MouseHandler <CONTROL>
 * 1: Scroll value <NUMBER>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_main_onMouseZChanged;
 *
 * Public: No
 */
params ["_ctrl","_value"];

if !(zade_spectator_camMode isEqualTo "EXTERNAL") exitWith {};

private _vec = zade_spectator_vector;
_value = _value * 0.1;
_vec = _vec vectorMultiply (1-_value);

if ([0,0,0] vectorDistance _vec < 0.5) exitWith {};

zade_spectator_vector = _vec;
