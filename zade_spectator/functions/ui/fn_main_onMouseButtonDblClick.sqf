/*
 * Author: DerZade
 * Triggerd by the 'onMouseButtonDblClick'-EH of the main mousehandler
 *
 * Arguments:
 * 0: Mouse Handler <CONTROL>
 * 1: Button <NUMBER>
 * 2: X Coordinate <NUMBER>
 * 3: Y Coordinate <NUMBER>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_main_onMouseButtonDblClick;
 *
 * Public: No
 */

params ["_ctrl","_btn","_x","_y"];

//switch to new unit
if (_btn isEqualTo 0) then {
     private _cursorTarget = ([getMousePosition select 0, getMousePosition select 1] call BIS_fnc_getIntersectionsUnderCursor);
     private _cursorObject = objNull;
     if (count _cursorTarget > 0) then {_cursorObject = (_cursorTarget select 0) select 3;};
     if (_cursorObject in ([] call zade_spectator_fnc_allUnits)) then {
          [_cursorObject] call zade_spectator_fnc_switchTarget;
     };
};
