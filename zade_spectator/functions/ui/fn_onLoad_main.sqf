/*
 * Author: Derzade
 * onLoad-EH of the main EH
 *
 * Arguments:
 * 0: Dialog <DISPLAY>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_onKeyDown;
 *
 * Public: No
 */
disableSerialization;
params ["_dialog"];

uiNamespace setVariable ['zade_spectator_main',_dialog];

//update both toolboxes
(_dialog displayCtrl 17) lbSetCurSel (["FREECAM","INTERNAL","EXTERNAL"] find zade_spectator_camMode);
(_dialog displayCtrl 11) lbSetCurSel ([west,east,resistance,civilian] find (side zade_spectator_target));

//update units tree
[] call zade_spectator_fnc_loadUnitsTree;

//set mission name (text over map)
(_dialog displayCtrl 21) ctrlSetText briefingName;
