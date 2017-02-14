/*
 * Author: Derzade
 * Triggered by the 'search' button in the interface
 *
 * Arguments:
 * 0: Button <CONTROL>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_btnClick_search;
 *
 * Public: No
 */
#include "..\..\idcmacros.hpp"
params ["_ctrl"];

private _edit = (ctrlParent _ctrl) displayCtrl IDC_LEFT_EDIT;

if (ctrlText _edit isEqualTo "") then {
     ctrlSetFocus _edit;
} else {
     _edit ctrlSetText "";
     [_edit] call zade_spectator_fnc_keyUp_search;
     ctrlSetFocus ((ctrlParent _ctrl) displayCtrl IDC_FOCUSBUTTON);
};
