/*
 * Author: DerZade
 * Triggerd by the 'onMouseMoving'-EH of left panel
 *
 * Arguments:
 * 0: Controls Group <CONTROL>
 * 3: Mouse Over  <BOOL>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_panel_onMouseMoving;
 *
 * Public: No
 */
 
params ["_ctrl","","","_mouseOver"];

if (_mouseOver and ctrlFade _ctrl isEqualTo 0) exitWith {};

if (_mouseOver) then {
     _ctrl ctrlSetFade 0;
} else {
     _ctrl ctrlSetFade 0.85;
};

_ctrl ctrlCommit 0.1;
