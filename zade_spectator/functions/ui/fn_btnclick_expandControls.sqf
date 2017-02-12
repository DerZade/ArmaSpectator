/*
 * Author: Derzade
 * Triggered by the 'collapse/expand' button in the controls
 *
 * Arguments:
 * 0: Button <CONTROL>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_btnClick_expandControls;
 *
 * Public: No
 */
#define GRID_W (pixelW * pixelGrid * 0.5)
#define GRID_H (pixelH * pixelGrid * 0.5)
#define GROUP_COLLAPSED (5.5 * GRID_H)
#define CAMERA_EXPANDED (GROUP_COLLAPSED * 10.5)
#define GENERAL_EXPANDED (GROUP_COLLAPSED * 10.2)
#define GENERAL_DIFF (GENERAL_EXPANDED - GROUP_COLLAPSED)

params ["_btn"];

private _display = ctrlParent _btn;

private _generalGrp = _display displayCtrl 31;
private _generalBtn = _display displayCtrl 33;
private _cameraGrp = _display displayCtrl 32;
private _cameraBtn = _display displayCtrl 34;

private _ctrlGrp = if (ctrlIDC _btn isEqualTo 33) then {"general"} else {"camera"};
private _expand = if ((ctrlPosition (_display displayCtrl (ctrlIDC _btn - 2)) select 3) > GROUP_COLLAPSED) then {"collapse"} else {"expand"};

//update btn texture
if (_expand isEqualTo "expand") then {
     _btn ctrlSetText "A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa";
} else {
     _btn ctrlSetText "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
};

private _cameraPos = +(ctrlPosition _cameraGrp);
private _generalPos = +(ctrlPosition _generalGrp);


switch (format ["%1_%2",_ctrlGrp,_expand]) do {
    case ("camera_expand"): {
         _cameraPos set [3, CAMERA_EXPANDED];
         _cameraGrp ctrlSetPosition _cameraPos;
         _cameraGrp ctrlCommit 0.15;
    };
    case ("camera_collapse"):{
         _cameraPos set [3, GROUP_COLLAPSED];
         _cameraGrp ctrlSetPosition _cameraPos;
         _cameraGrp ctrlCommit 0.15;
    };
     case ("general_expand"): {
          _generalPos set [3, GENERAL_EXPANDED];
          _generalGrp ctrlSetPosition _generalPos;
          _generalGrp ctrlCommit 0.15;

          _cameraPos set [1, (_generalPos select 1) + (_generalPos select 3)+ GROUP_COLLAPSED * 0.5];
          _cameraGrp ctrlSetPosition _cameraPos;
          _cameraGrp ctrlCommit 0.15;
     };
     case ("general_collapse"):{
          _generalPos set [3, GROUP_COLLAPSED];
          _generalGrp ctrlSetPosition _generalPos;
          _generalGrp ctrlCommit 0.15;

          _cameraPos set [1, (_generalPos select 1) + (_generalPos select 3)+ GROUP_COLLAPSED * 0.5];
          _cameraGrp ctrlSetPosition _cameraPos;
          _cameraGrp ctrlCommit 0.15;
     };
};

//update buttons
_cameraBtn ctrlSetPosition [(_cameraPos select 0) + 0.5*GRID_W, (_cameraPos select 1) + 0.5*GRID_H];
_cameraBtn ctrlCommit 0.15;

_generalBtn ctrlSetPosition [(_generalPos select 0) + 0.5*GRID_W, (_generalPos select 1) + 0.5*GRID_H];
_generalBtn ctrlCommit 0.15;

//adjust background height
private _backgroundPos = +(ctrlPosition ((ctrlParentControlsGroup _cameraGrp) controlsGroupCtrl 1337));
_backgroundPos set [3, ((_cameraPos select 1) + (_cameraPos select 3) + GROUP_COLLAPSED * 0.5)]; //camera y + camera h + little bit of space

//make sure the backgorund doesn't get smaller then the content group
if (_backgroundPos select 3 < (ctrlPosition (ctrlParentControlsGroup _cameraGrp)) select 3) then {
     _backgroundPos set [3, (ctrlPosition (ctrlParentControlsGroup _cameraGrp)) select 3];
};
((ctrlParentControlsGroup _cameraGrp) controlsGroupCtrl 1337) ctrlSetPosition _backgroundPos;
((ctrlParentControlsGroup _cameraGrp) controlsGroupCtrl 1337) ctrlCommit 0.15;
