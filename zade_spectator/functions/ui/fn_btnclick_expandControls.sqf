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
params ["_ctrl"];

private _ctrlGrp = ctrlParentControlsGroup _ctrl;
private _dialog = ctrlParent _ctrl;

private _expand = _ctrlGrp call {(ctrlPosition _this) select 3 < 5.6*(pixelH * pixelGrid * 0.5)};

if (_expand) then {
     //update texture
     _ctrl ctrlSetText ("A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa");

     if (ctrlIDC _ctrlGrp isEqualTo 31) then { //expand general controls
          //expand general controls
          private _pos = +(ctrlPosition _ctrlGrp);
          _pos set [3,49.5*(pixelH * pixelGrid * 0.5)];
          _ctrlGrp ctrlSetPosition _pos;
          _ctrlGrp ctrlCommit 0.2;

          private _pos = ctrlPosition (_dialog displayCtrl 311);
          _pos set [3,5.5 * 8 * (pixelH * pixelGrid * 0.5)];
          (_dialog displayCtrl 311) ctrlSetPosition _pos;
          (_dialog displayCtrl 311) ctrlCommit 0;

          //move camera controls
          private _camGrp = _dialog displayCtrl 32;
          private _pos = ctrlPosition _camGrp;
          _pos set [1, 55*(pixelH * pixelGrid * 0.5)];
          _camGrp ctrlSetPosition _pos;
          _camGrp ctrlCommit 0.2;

     } else { //expand camera controls
          private _pos = +(ctrlPosition _ctrlGrp);
          _pos set [3, 55*(pixelH * pixelGrid * 0.5)];
          _ctrlGrp ctrlSetPosition _pos;
          _ctrlGrp ctrlCommit 0.2;
     };
} else {
     //update texture
     _ctrl ctrlSetText ("A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa");

     if (ctrlIDC _ctrlGrp isEqualTo 31) then { //collapse general controls
          private _pos = ctrlPosition _ctrlGrp;
          _pos set [3, 5.5*(pixelH * pixelGrid * 0.5)];
          _ctrlGrp ctrlSetPosition _pos;
          _ctrlGrp ctrlCommit 0.2;

          private _pos = ctrlPosition (_dialog displayCtrl 311);
          _pos set [3,0];
          (_dialog displayCtrl 311) ctrlSetPosition _pos;
          (_dialog displayCtrl 311) ctrlCommit 0.2;

          //move cam controls
          private _camGrp = _dialog displayCtrl 32;
          private _pos = ctrlPosition _camGrp;
          _pos set [1, 11*(pixelH * pixelGrid * 0.5)];
          _camGrp ctrlSetPosition _pos;
          _camGrp ctrlCommit 0.2;

     } else { //collapse camera controls
          private _pos = +(ctrlPosition _ctrlGrp);
          _pos set [3, 5.5*(pixelH * pixelGrid * 0.5)];
          _ctrlGrp ctrlSetPosition _pos;
          _ctrlGrp ctrlCommit 0.2;
     };
};
