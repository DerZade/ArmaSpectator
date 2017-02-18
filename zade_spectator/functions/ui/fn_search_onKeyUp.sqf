/*
 * Author: Derzade
 * Triggered by the KeyUp-EH of the search RscEdit
 *
 * Arguments:
 * 0: Edit <CONTROL>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_search_onKeyUp;
 *
 * Public: No
 */
#include "..\..\idcmacros.hpp"
params ["_ctrl","_key"];

private _dialog = ctrlParent _ctrl;
private _searchKey = toLower (ctrlText _ctrl);

private _btn = _dialog displayCtrl IDC_LEFT_SEARCH;
private _tree = _dialog displayCtrl IDC_LEFT_TREE;
private _treeResults = _dialog displayCtrl IDC_LEFT_RESULTS;

if (_key in [28,1]) exitWith {
     _ctrl ctrlSetText "";
     [_ctrl] call zade_spectator_fnc_search_onKeyUp;
     ctrlSetFocus ((ctrlParent _ctrl) displayCtrl IDC_FOCUSBUTTON);
     true;
};

if (_tree tvText [0] isEqualTo "You are not allowed") exitWith {};

//show panel
if !(ctrlFade (_dialog displayCtrl IDC_LEFTPANEL) isEqualTo 0) then {
     (_dialog displayCtrl IDC_LEFTPANEL) ctrlSetFade 0;
     (_dialog displayCtrl IDC_LEFTPANEL) ctrlCommit 0;
};

if (_searchKey isEqualTo "") then {
     _btn ctrlSetText "\a3\3den\data\displays\display3den\search_start_ca.paa";

     _treeResults ctrlShow false;
     _tree ctrlShow true;

} else {
     _btn ctrlSetText "\a3\3den\data\displays\display3den\search_end_ca.paa";

     _treeResults ctrlShow true; //show results tree
     _tree ctrlShow false;

     tvClear _treeResults;

     //for all groups in _tree
     for "_g" from 0 to ((_tree tvCount []) - 1) do {

          private _grpName = _tree tvText [_g];

          //add group
          private _grpPath = _treeResults tvAdd [[],_grpName];
          _treeResults tvSetPicture [[_grpPath],(_tree tvPicture [_g])];
          _treeResults tvSetPictureColor [[_grpPath],(call compile (_tree tvData [_g]))];

          //highlight group if key is in its name
          if ((toLower _grpName) find _searchKey != -1) then {_treeResults tvSetColor [[_grpPath],[0.7,0.6,0,1]];};

          //for all units in cur group in _tree
          for "_u" from 0 to ((_tree tvCount [_g]) -1) do {
               private _unitName = _tree tvText [_g,_u];

               //add unit if key in unit's name or in groupID
               if ((toLower _unitName) find _searchKey != -1 or (toLower _grpName) find _searchKey != -1) then {
                    //add unit
                    _unitPath = _treeResults tvAdd [[_grpPath],_unitName];
                    _treeResults tvSetPicture [[_grpPath,_unitPath],(_tree tvPicture [_g,_u])];
                    _treeResults tvSetPictureColor [[_grpPath,_unitPath],(call compile (_tree tvData [_g,_u]))];
                    _treeResults tvSetValue [[_grpPath,_unitPath],(_tree tvValue [_g,_u])];

                    //highlight unit if key is in its name
                    if ((toLower _unitName) find _searchKey != -1) then {_treeResults tvSetColor [[_grpPath,_unitPath],[0.7,0.6,0,1]];};
               };
          };

          //delete group again when no results were found
          if (_treeResults tvCount [_grpPath] == 0) then {
               _treeResults tvDelete [_grpPath];
          } else {
               _treeResults tvExpand [_grpPath];
          };
     };

};
