/*
 * Author: Derzade
 * onMouseButtonDown-EH
 *
 * Arguments:
 * 0: MouseHandler <CONTROL>
 * 1: Mousebutton <CONTROL>
 * 2: X of mousecursor <NUMBER>
 * 3: Y of mousecursor <NUMBER>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_onMouseButtonDown;
 *
 * Public: No
 */
params ["_ctrl","_x","_y"];

if !(zade_spectator_camMode isEqualTo "EXTERNAL") exitWith {};

private _offsetx = (zade_spectator_mousePos select 0) - _x;
private _offsety = (zade_spectator_mousePos select 1) - _y;

zade_spectator_mousePos = [_x,_y];

private _vec = [zade_spectator_vector,180*_offsetx] call BIS_fnc_rotateVector2D;

//get current angle of camera to target
private _vec2 = +(_vec);
_vec2 set [2,0];
private _prevAngle = acos ((_vec vectorDotProduct _vec2) / (([0,0,0] vectorDistance _vec) * ([0,0,0] vectorDistance _vec2)));

private _newAngle = 80 min (1 max (_prevAngle - 89*_offsety));

private _a = ([0,0,0] vectorDistance _vec) * sin _newAngle;
private _b = ([0,0,0] vectorDistance _vec) * cos _newAngle;

_vec2 = _vec2 vectorMultiply (1/(([0,0,0] vectorDistance _vec2) / _b));

zade_spectator_vector = _vec2 vectorAdd [0,0,_a];
