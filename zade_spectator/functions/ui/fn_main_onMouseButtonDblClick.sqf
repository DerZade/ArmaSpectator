params ["_ctrl","_btn","_x","_y"];

//switch to new unit
if (_btn isEqualTo 0) then {
     private _cursorTarget = ([getMousePosition select 0, getMousePosition select 1] call BIS_fnc_getIntersectionsUnderCursor);
     private _cursorObject = objNull;
     if (count _cursorTarget > 0) then {_cursorObject = (_cursorTarget select 0) select 3;};
     if (_cursorObject in zade_spectator_spectateableUnits) then {
          [_cursorObject] call zade_spectator_fnc_switchTarget;
     };
};
