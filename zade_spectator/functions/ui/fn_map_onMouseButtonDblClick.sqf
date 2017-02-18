/*
 * Author: Derzade
 * Triggred by a click on the map
 *
 * Arguments:
 * 0: Map <CONTROL>
 * 1: Mousebutton <NUMBER>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_map_onMouseButtonClick;
 *
 * Public: No
 */
#include "..\..\idcmacros.hpp"
params ["_ctrl","_btn"];

private _mapScale = ctrlMapScale _ctrl;
private _dialog = ctrlParent _ctrl;
private _mousePos = _ctrl ctrlMapScreenToWorld getMousePosition;

switch (_btn) do {
     case (0): { //switch target
          //get cursorTarget
          private _cursorTarget = objNull;
          private _distance = 200 * _mapScale;
          //normal units
          {
               if ((getPos _x) distance2D _mousePos < _distance) then {_cursorTarget = _x};
          } forEach ([] call zade_spectator_fnc_allUnits);
          //dead units
          if (cbChecked (_dialog displayCtrl IDC_LEFT_CHECKBOX) and _mapScale < 0.5) then {
               {
                    {
                         if ((getPos _x) distance2D _mousePos < _distance) then {_cursorTarget = _x};
                    } forEach (_x select 1);
               } forEach zade_spectator_deadUnits;
          };

          if !(_cursorTarget isEqualTo objNull) exitWith {
                [_cursorTarget] call zade_spectator_fnc_switchTarget;
          };
     };
};
