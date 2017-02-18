/*
 * Author: Derzade
 * Switches target (curently spectated unit) on local spectator
 *
 * Arguments:
 * 0: New Target <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [hans] call zade_spectator_fnc_switchTarget;
 *
 * Public: No
 */
#include "..\..\idcmacros.hpp"
params ["_unit"];

zade_spectator_target = _unit;

switch (zade_spectator_camMode) do {
     case ("INTERNAL"): {
          _unit switchCamera "INTERNAL";
     };
     case ("EXTERNAL"): {
          zade_spectator_camera camSetTarget zade_spectator_target;
          if !(vehicle zade_spectator_target isEqualTo zade_spectator_target) then {
               zade_spectator_camera camSetTarget (vehicle zade_spectator_target);
          };
     };
     case ("FREECAM"): {
          private _pos = [zade_spectator_target, 7,(direction zade_spectator_target -180)] call BIS_fnc_relPos;
          _pos set [2,3];
          zade_spectator_camera setPos _pos;
          zade_spectator_camera setDir (direction zade_spectator_target);
     };
};

//check whether dialog is open
private _dialog = uiNamespace getVariable ["zade_spectator_main",nil];
if (isNil "_dialog") exitWith {};

//update dialog
private _side = side zade_spectator_target;

if !(alive zade_spectator_target) then {
     _side = [_unit] call zade_spectator_fnc_deadside;
};

(_dialog displayCtrl IDC_LEFT_SIDE) lbSetCurSel ([west,east,resistance,civilian] find _side);
[] call zade_spectator_fnc_loadUnitsTree;
