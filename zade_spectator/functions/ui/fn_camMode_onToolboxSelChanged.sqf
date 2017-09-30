/*
 * Author: DerZade
 * Triggerd by the 'onToolboxSelChanged'-EH of the camMode Toolbox
 *
 * Arguments:
 * 0: Toobox <CONTROL>
 * 1: Selected Index <NUMBER>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_camMode_onToolboxSelChanged;
 *
 * Public: No
 */

params ["_toolbox","_curIndex"];

private _oldIndex = ['FREECAM','INTERNAL','EXTERNAL'] find zade_spectator_cammode;
private _newMode = ['FREECAM','INTERNAL','EXTERNAL'] select _curIndex;

if !(["cammode", _newMode] call zade_spectator_fnc_getRestrictions) exitWith {
     [format["Not allowed to use: %1",_newMode],[1,0.55,0,1]] call zade_spectator_fnc_hint;
     _toolbox lbsetCurSel _oldIndex;
};

[_newMode] call zade_spectator_fnc_switchCamMode;
