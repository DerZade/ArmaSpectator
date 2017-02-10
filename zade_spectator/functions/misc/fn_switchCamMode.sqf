/*
 * Author: Derzade
 * Switches cam mode on local spectator
 *
 * Arguments:
 * 0: Cam mode <STRING>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * ["INTERNAL"] call zade_spectator_fnc_switchCamMode;
 *
 * Public: No
 */
disableSerialization;

params [["_camMode",""]];

if !(_camMode in ["INTERNAL","EXTERNAL","FREECAM"]) exitWith {["Invalid cammode: %1",_camMode] call BIS_fnc_error;};

if !(_camMode in (missionNamespace getVariable ["zade_spectator_allowedCamMode",["FREECAM","INTERNAL","EXTERNAL"]])) exitWith {
     ["This camera mode is disabled.",[1,1,0,1]] call zade_spectator_hint;
};

//reset to normal state
switch (zade_spectator_camMode) do {
     case ("INTERNAL"): {
          player switchCamera "INTERNAL";
          detach player;
     };
     case ("EXTERNAL"): {
          ["zade_spectator_updateExternalCam","onEachFrame"] call BIS_fnc_removeStackedEventHandler;
          zade_spectator_camera cameraEffect ["Terminate", "back"];
          detach player;
     };
     case ("FREECAM"): {
          zade_spectator_camera cameraEffect ["Terminate", "back"];
          detach player;
     };
};

//update dialog if it's open
private _dialog = uiNamespace getVariable 'zade_spectator_main';
if !(isNil "_dialog") then {
     (_dialog displayCtrl 17) lbSetCurSel (["FREECAM","INTERNAL","EXTERNAL"] find _camMode);
};

switch (_camMode) do {
     case ("INTERNAL"): {
          zade_spectator_target switchCamera "INTERNAL";

          cameraEffectEnableHUD true;
          showHUD [true, false, false, false, false, false, false, true];

          player attachTo [zade_spectator_target,[0,0,0],"pilot"];
     };
     case ("EXTERNAL"): {
          private _camera = "camera" camCreate eyePos zade_spectator_target;
          _camera cameraEffect ["internal", "back"];
          showCinemaBorder false;
          cameraEffectEnableHUD true;
          showHUD [true, true, true, true, true, true, true, true];
          _camera camSetTarget zade_spectator_target;
          if !(vehicle zade_spectator_target isEqualTo zade_spectator_target) then {
               _camera camSetTarget (vehicle zade_spectator_target);
          };
          zade_spectator_camera = _camera;

          private _pos = [zade_spectator_target, 7,(direction zade_spectator_target -180)] call BIS_fnc_relPos;
          _pos set [2,3];
          private _vec = _pos vectorDiff (getPos zade_spectator_target);
          zade_spectator_vector = [_vec,direction zade_spectator_target] call BIS_fnc_rotateVector2D;

          ["zade_spectator_updateExternalCam","onEachFrame","_vec = if (vehicle zade_spectator_target isEqualTo zade_spectator_target) then {zade_spectator_vector vectorAdd (zade_spectator_target selectionPosition 'head')} else {zade_spectator_vector}; zade_spectator_camera camSetRelPos _vec; zade_spectator_camera camCommit 0;"] call BIS_fnc_addStackedEventHandler;
          player attachTo [zade_spectator_camera,[0,0,0]];
     };
     case ("FREECAM"): {
          private _camera = "camcurator" camCreate eyePos zade_spectator_target;
          _camera cameraEffect ["internal", "back"];
          private _pos = [zade_spectator_target, 7,(direction zade_spectator_target -180)] call BIS_fnc_relPos;
          _pos set [2,3];
          _camera setPos _pos;
          _camera setDir (direction zade_spectator_target);
          _camera camCommand "maxPitch 90.0";
          _camera camCommand "minPitch -90.0";
          _camera camCommand "speedDefault 0.1";
          _camera camCommand "speedMax 2.0";
          _camera camCommand "ceilingHeight 5000";
          cameraEffectEnableHUD true;
          showHUD [true, true, true, true, true, true, true, true];
          _camera spawn { sleep 1; _this camCommand "surfaceSpeed off";};
          zade_spectator_camera = _camera;

          //attach spectator unit to camera
          private _offset = (getPos player) vectorAdd ((player selectionPosition "head") vectorMultiply -1);
          player attachTo [zade_spectator_camera,[0,0,0]];
     };
};

zade_spectator_camMode = _camMode;
