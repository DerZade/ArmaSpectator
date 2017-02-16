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
 * _this call zade_spectator_fnc_mapClick;
 *
 * Public: No
 */
#include "..\..\idcmacros.hpp"
params ["_ctrl","_btn"];

private _mapScale = ctrlMapScale _ctrl;
private _dialog = ctrlParent _ctrl;
private _mousePos = _ctrl ctrlMapScreenToWorld getMousePosition;

switch (_btn) do {
     case (0): { //set freecam
          if (zade_spectator_camMode isEqualTo "FREECAM") then {
               _mousePos set [2,(getPos zade_spectator_camera) select 2];
               zade_spectator_camera setPos _mousePos;
          };
     };
};
