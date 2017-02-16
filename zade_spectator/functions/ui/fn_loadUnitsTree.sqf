/*
 * Author: Derzade
 * This functions updates the units tree
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [] call zade_spectator_fnc_loadUnitsTree;
 *
 * Public: No
 */
#include "..\..\idcmacros.hpp"
disableSerialization;

private _dialog = uiNamespace getVariable ["zade_spectator_main",nil];

if (isNil "_dialog") exitWith {};

private _tree = _dialog displayCtrl IDC_LEFT_TREE;
private _side = [west,east,resistance,civilian] select ((lbCurSel (_dialog displayCtrl IDC_LEFT_SIDE)) max 0);

private _allUnits = +([_side] call zade_spectator_fnc_allUnits);
private _addedGrps = [];
private _targetPath = [-1];

zade_spectator_treeUnits = [];

//clear tree
tvClear _tree;

if !(_side in (missionNamespace getVariable ["zade_spectator_allowedSides",[west,east,resistance,civilian]])) exitWith {
     ["You are not allowed to specate this side.",[1,0.55,0,1]] call zade_spectator_fnc_hint;
};

{
     private _grp = _x;

     //check if a unit of '_allUnits' (which includes all units to draw) is in the given group
     if (count ((units _grp) arrayIntersect _allUnits) > 0) then {

          //add group to tree
          private _grpPath = _tree tvAdd [[],groupID _grp];
          _tree tvSetPicture [[_grpPath],"\a3\ui_f\data\map\markers\nato\b_unknown.paa"];
          _tree tvSetPictureColor [[_grpPath],[_side] call BIS_fnc_sideColor];
          _tree tvSetData [[_grpPath],str ([_side] call BIS_fnc_sideColor)];

          //add units
          {
               if (_x in _allUnits) then {
                    //get the icon
                    _unitIcon = if ([_x] call zade_spectator_fnc_isMedic) then {"Medic"} else {""};
                    if (_x isEqualTo leader _grp) then {_unitIcon = "Leader";};

                    private _unitPath = _tree tvAdd [[_grpPath],name _x];
                    _tree tvSetPicture [[_grpPath,_unitPath],format ["\a3\ui_f\data\map\vehicleicons\iconMan%1_ca.paa",_unitIcon]];
                    _tree tvSetPictureColor [[_grpPath,_unitPath],[_side] call BIS_fnc_sideColor];
                    _tree tvSetData [[_grpPath,_unitPath],str ([_side] call BIS_fnc_sideColor)];

                    //vehicle icon
                    if !(vehicle _x isEqualTo _x) then {
                         _tree tvSetPictureRight [[_grpPath,_unitPath],getText (configFile >> "CfgVehicles" >> (typeOf (vehicle _x)) >> "icon")];
                    };
                    //check whether unit is the current target
                    if (_x isEqualTo zade_spectator_target) then {_targetPath = [_grpPath,_unitPath];};

                    _tree tvSetValue [[_grpPath,_unitPath],count zade_spectator_treeUnits];
                    zade_spectator_treeUnits pushBack _x;
               };
          } forEach (units _grp);

          //add dead units
          if (cbChecked (_dialog displayCtrl IDC_LEFT_CHECKBOX)) then {
               private _index = [zade_spectator_dead,_grp] call zade_spectator_fnc_findInPairs;
               if !(_index isEqualTo -1) then {
                    {
                         private _unitPath = _tree tvAdd [[_grpPath],(_x getVariable "zade_spectator_name")];
                         _tree tvSetPicture [[_grpPath,_unitPath],"a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa"];
                         _tree tvSetPictureColor [[_grpPath,_unitPath],[0.1,0.1,0.1,1]];
                         _tree tvSetData [[_grpPath,_unitPath],"[0.1,0.1,0.1,1]"];

                         //check if cur target
                         if (_x isEqualTo zade_spectator_target) then {_targetPath = [_grpPath,_unitPath];};

                         //add the corresponding unit
                         _tree tvSetValue [[_grpPath,_unitPath],count zade_spectator_treeUnits];
                         zade_spectator_treeUnits pushBack _x;
                    } forEach (zade_spectator_dead select _index select 1);
               };
          };

          //expand group
          _tree tvExpand [_grpPath];

          _addedGrps pushBack _grp;

     };
} forEach allGroups;

//add dead groups
if (cbChecked (_dialog displayCtrl IDC_LEFT_CHECKBOX)) then {
     {
          //check for side
          if (side (_x select 0) isEqualTo _side and !((_x select 0) in _addedGrps)) then {

               private _grpPath = _tree tvAdd [[],groupID (_x select 0)];
               _tree tvSetPicture [[_grpPath],"\a3\ui_f\data\map\markers\nato\b_unknown.paa"];
               _tree tvSetPictureColor [[_grpPath],[0.1,0.1,0.1,1]];
               _tree tvSetData [[_grpPath],"[0.1,0.1,0.1,1]"];

               //add units
               {
                    private _unitPath = _tree tvAdd [[_grpPath],(_x getVariable "zade_spectator_name")];
                    _tree tvSetPicture [[_grpPath,_unitPath],"a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa"];
                    _tree tvSetPictureColor [[_grpPath,_unitPath],[0.1,0.1,0.1,1]];
                    _tree tvSetData [[_grpPath,_unitPath],"[0.1,0.1,0.1,1]"];

                    //check if cur target
                    if (_x isEqualTo zade_spectator_target) then {_targetPath = [_grpPath,_unitPath];};

                    _tree tvSetValue [[_grpPath,_unitPath],count zade_spectator_treeUnits];
                    zade_spectator_treeUnits pushBack _x;
               } forEach (_x select 1);

               //expand group
               _tree tvExpand [_grpPath];

          };
     } forEach (zade_spectator_dead);
};

//select the target
_tree tvsetPictureColor [_targetPath,ACTIVECOLOR_SCRIPT];
_tree tvsetData [_targetPath,str ACTIVECOLOR_SCRIPT];

_tree tvsetColor [_targetPath,ACTIVECOLOR_SCRIPT];

if !(ctrlText (_dialog displayCtrl IDC_LEFT_EDIT) isEqualTo "") then {
     [(_dialog displayCtrl IDC_LEFT_EDIT)] call zade_spectator_fnc_keyUp_search;
};
