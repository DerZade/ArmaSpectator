/*
 * Author: Derzade
 * onLoad of listboxes in the controls.
 *
 * Arguments:
 * 0: List <CONTROL>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_onLoad_controlsList;
 *
 * Public: No
 */
params ["_listbox"];

if (ctrlidc (ctrlParentControlsGroup _listbox) isEqualTo 31) then {
//GENERAL CONTROLS
     {
          _listbox lnbAddRow _x;
     } forEach [['Search',format ['"%1+%2", %3',toString (toArray keyName 29 - [34]),toString (toArray keyName 33 - [34]), keyName 61]],['Toggle Interface',keyName 14],['Toggle Map',keyName 50],['Toggle Controls',keyName 59],['Cycle Camera-Mode',keyName 46],['Cycle Vision-Mode',keyName 49],['Toogle 3D-Markers',keyName 48],['Toogle TFAR',keyName 20]];
} else {
//CAMERA CONTROLS

};
