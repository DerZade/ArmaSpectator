/*
 * Author: DerZade
 * onLoad-EH of the main EH
 *
 * Arguments:
 * 0: Dialog <DISPLAY>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_main_onKeyDown;
 *
 * Public: No
 */
 
#include "..\..\idcmacros.hpp"

disableSerialization;

params ["_dialog"];

uiNamespace setVariable ['zade_spectator_main',_dialog];

//update both toolboxes
(_dialog displayCtrl IDC_LEFT_CAMMODE) lbSetCurSel (["FREECAM","INTERNAL","EXTERNAL"] find zade_spectator_camMode);
(_dialog displayCtrl IDC_LEFT_SIDE) lbSetCurSel ([side (group zade_spectator_target)] call BIS_fnc_sideID);

//update units tree
[] call zade_spectator_fnc_loadUnitsTree;

//set mission name (text over map)
(_dialog displayCtrl IDC_MAP_MISSION) ctrlSetText briefingName;
