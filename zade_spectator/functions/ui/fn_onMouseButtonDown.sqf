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
params ["_ctrl","_btn","_x","_y"];

switch (zade_spectator_camMode) do {
     case ("EXTERNAL"): { //update camera position
          if (_btn isEqualTo 1) then {
               zade_spectator_mousePos = [_x,_y];
               _ctrl ctrlAddEventHandler ["MouseButtonUp","if (_this select 1 isEqualTo 1) then {(_this select 0) ctrlRemoveAllEventHandlers 'MouseMoving';(_this select 0) ctrlRemoveAllEventHandlers 'MouseButtonUp';};"];
               _ctrl ctrlAddEventHandler ["MouseMoving",zade_spectator_fnc_onMouseMoving];
          };
     };
};
