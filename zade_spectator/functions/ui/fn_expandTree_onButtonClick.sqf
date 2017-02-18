/*
 * Author: Derzade
 * Triggered by the 'expand' button in the interface
 *
 * Arguments:
 * 0: Button <CONTROL>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_expandTree_onButtonClick;
 *
 * Public: No
 */
#include "..\..\idcmacros.hpp"
params ["_ctrl"];

{
     private _tree = (ctrlParent _ctrl) displayCtrl _x;
     for "_i" from 0 to ((_tree tvCount []) - 1) do {
          _tree tvExpand [_i];
     };
} forEach [IDC_LEFT_TREE,IDC_LEFT_RESULTS]; //for normal and search results tree
