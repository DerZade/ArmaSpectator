/*
 * Author: DerZade
 * Main KeyDown-EH of the UI
 *
 * Arguments:
 * 0: Dialog <DISPLAY>
 * 1: Key ID <NUMBER>
 * 2: Shift pressed <BOOL>
 * 3: Control pressed <BOOL>
 * 4: Alt pressed <BOOL>
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

params ["_dialog","_key","_shift","_ctrl","_alt"];

//make sure the user isn't typing in the search field
if (missionNamespace getVariable ["zade_spectator_editFocused",false] and _key isEqualTo 1) exitWith {true;};
if (missionNamespace getVariable ["zade_spectator_editFocused",false]) exitWith {};

switch (true) do {
     case (_key in (actionKeys "CameraTarget")): {  //F - Move to target

          switch (zade_spectator_camMode) do {
               case "EXTERNAL": {
                    zade_spectator_vector = [0,-7,3];
               };
               case "FREECAM": {
                    private _pos = [zade_spectator_target, 7,(direction zade_spectator_target -180)] call BIS_fnc_relPos;
                    _pos set [2,3];
                    zade_spectator_camera setPos _pos;
                    zade_spectator_camera setDir (direction zade_spectator_target);
               };
          };

          true;
     };
     case (_key in actionKeys "CameraInterface"): { //BACKSPACE - Toggle Interface
          if (ctrlShown (_dialog displayCtrl IDC_LEFTPANEL)) then {
               //show fake panel
               (_dialog displayCtrl IDC_FAKEPANEL) ctrlShow true;
               (_dialog displayCtrl IDC_FAKEPANEL) ctrlSetFade (ctrlFade (_dialog displayCtrl IDC_LEFTPANEL)); //apply same fade
               (_dialog displayCtrl IDC_FAKEPANEL) ctrlCommit 0;

               //hide panel
               (_dialog displayCtrl IDC_LEFTPANEL) ctrlSetFade 1;
               (_dialog displayCtrl IDC_LEFTPANEL) ctrlCommit 0.2;
               _null = [(_dialog displayCtrl IDC_LEFTPANEL)] spawn {disableSerialization; sleep 0.2; (_this select 0) ctrlShow false;};

               //hide hint if open
               private _hintDisplay = uiNamespace getVariable ['zade_spectator_hint',nil];
               if !(isNil "_hintDisplay") then {
                    (_hintDisplay displayCtrl IDC_HINT_TEXT) ctrlSetFade 1;
                    (_hintDisplay displayCtrl IDC_HINT_TEXT) ctrlCommit 0.2;
               };
          } else {
               //show panel
               (_dialog displayCtrl IDC_LEFTPANEL) ctrlShow true;
               (_dialog displayCtrl IDC_LEFTPANEL) ctrlSetFade (ctrlFade (_dialog displayCtrl IDC_FAKEPANEL)); //apply same fade
               (_dialog displayCtrl IDC_LEFTPANEL) ctrlCommit 0.2;

               //show hint if open
               private _hintDisplay = uiNamespace getVariable ['zade_spectator_hint',nil];
               if !(isNil "_hintDisplay") then {
                    (_hintDisplay displayCtrl IDC_HINT_TEXT) ctrlSetFade 0;
                    (_hintDisplay displayCtrl IDC_HINT_TEXT) ctrlCommit 0.2;
               };

               //hide search results
               if (ctrlText (_dialog displayCtrl IDC_LEFT_EDIT) isEqualTo "") then {
                    (_dialog displayCtrl IDC_LEFT_RESULTS) ctrlShow false;
               } else {
                    (_dialog displayCtrl IDC_LEFT_TREE) ctrlShow false;
               };

               //hide fake panel
               (_dialog displayCtrl IDC_FAKEPANEL) ctrlShow false;

               //update tree
               [] call zade_spectator_fnc_loadUnitsTree;
          };
          true;
     };
     case (_key in actionKeys "CameraMoveTurbo2"): { //LALT - Speed
         if (zade_spectator_cammode isEqualTo "FREECAM") then {
               zade_spectator_camera camCommand "speedDefault 2.0";
               zade_spectator_camera camCommand "speedBoost 5.0";
         };
         true;
     };
     case (_key in (actionKeys "CameraVisionMode")): { //N - Toogle Vision mode

          if (zade_spectator_cammode isEqualTo "INTERNAL") exitWith {true;};

          zade_spectator_visionMode = ([[["NORMAL","NV"],["NV","TI WHOT"],["TI WHOT","TI BHOT"],["TI BHOT","NORMAL"]],zade_spectator_visionMode] call BIS_fnc_getfromPairs);

          //reset cam vision mode
          camUseNVG false;
          false setCamUseTi 0;

          switch (zade_spectator_visionMode) do {
              case ("NV"): {
                   camUseNVG true;
              };
              case ("TI WHOT"): {
                   true setCamUseTi 0;
              };
              case ("TI BHOT"): {
                   true setCamUseTi 1;
              };
          };
          playSound "RscDisplayCurator_visionMode";
          true;
     };
     case (_key in [1]): { //ESC
          if (ctrlShown (_dialog displayCtrl IDC_MAP)) exitWith {
               (_dialog displayCtrl IDC_MAP) ctrlShow false;
               if (zade_spectator_camMode isEqualTo "FREECAM") then {(call zade_spectator_fnc_camera) camCommand "manual on";};
               true;
          };
          if (ctrlShown (_dialog displayCtrl IDC_CONTROLS)) exitWith {
               (_dialog displayCtrl IDC_CONTROLS) ctrlShow false;
               if (zade_spectator_camMode isEqualTo "FREECAM") then {(call zade_spectator_fnc_camera) camCommand "manual on";};
               true;
          };

          private _displayType = if (isMultiplayer) then { "RscDisplayMPInterrupt" } else { "RscDisplayInterrupt" };
          _dialog createDisplay _displayType;

          ((findDisplay 49) displayCtrl 103) ctrlEnable false;
          ((findDisplay 49) displayCtrl 119) ctrlEnable false;
          ((findDisplay 49) displayCtrl 104) ctrlSetEventHandler ["buttonClick", "['end1',false,0] call BIS_fnc_endMission;"];
          true;
     };
     case (_key in [59]): { //F1 - Toogle Controls

          if (ctrlShown (_dialog displayCtrl IDC_CONTROLS)) then {
               //hide controls
               (_dialog displayCtrl IDC_CONTROLS) ctrlShow false;
               if (zade_spectator_camMode isEqualTo "FREECAM") then {(call zade_spectator_fnc_camera) camCommand "manual on";};
          } else {
               //show controls
               (_dialog displayCtrl IDC_CONTROLS) ctrlShow true;
               if (zade_spectator_camMode isEqualTo "FREECAM") then {(call zade_spectator_fnc_camera) camCommand "manual off";};
               {(_dialog displayCtrl _x) ctrlShow false;} forEach [IDC_CONTROLS_FREECAM_LIST,IDC_CONTROLS_EXTERNAL_LIST,IDC_CONTROLS_INTERNAL_LIST];
               (_dialog displayCtrl (IDC_CONTROLS_FREECAM_LIST+(lbCurSel (_dialog displayCtrl IDC_CONTROLS_TOOLBOX)))) ctrlShow true;
          };
          true;
     };
     case (_key in [61]): { //F3 - Search

          //focus search edit
          ctrlSetFocus (_dialog displayCtrl IDC_LEFT_EDIT);

          //show panel
          if !(ctrlFade (_dialog displayCtrl IDC_LEFTPANEL) isEqualTo 0) then {
               (_dialog displayCtrl IDC_LEFTPANEL) ctrlSetFade 0;
               (_dialog displayCtrl IDC_LEFTPANEL) ctrlCommit 0;
          };
          true;
     };

     case (_key in [33]): { //F - (+ CTRL) Search

          if (_ctrl and !_shift and !_alt) then {
               //focus search edit
               ctrlSetFocus (_dialog displayCtrl IDC_LEFT_EDIT);

               //show panel
               if !(ctrlFade (_dialog displayCtrl IDC_LEFTPANEL) isEqualTo 0) then {
                    (_dialog displayCtrl IDC_LEFTPANEL) ctrlSetFade 0;
                    (_dialog displayCtrl IDC_LEFTPANEL) ctrlCommit 0;
               };
          };
          true;
     };
     case (_key in [50]): { //M - Toggle map
          if (ctrlShown (_dialog displayCtrl IDC_MAP)) then {
               //hide map
               (_dialog displayCtrl IDC_MAP) ctrlShow false;

               if (zade_spectator_camMode isEqualTo "FREECAM") then {(call zade_spectator_fnc_camera) camCommand "manual on";};
          } else {
               //center map on camera
               (_dialog displayCtrl IDC_MAP_MAP) ctrlMapAnimAdd [0, 0.05, (call zade_spectator_fnc_camera)];
               ctrlMapAnimCommit (_dialog displayCtrl IDC_MAP_MAP);

               //show map
               (_dialog displayCtrl IDC_MAP) ctrlShow true;

               if (zade_spectator_camMode isEqualTo "FREECAM") then {(call zade_spectator_fnc_camera) camCommand "manual off";};
          };
          true;
     };
     case (_key in [20]): { //T - Toggle TFAR

          [] call zade_spectator_fnc_toggleTFAR;
          true;
     };
     case (_key in [46]): { //C - Cycle cammode

          private _camMode = if (lbCurSel (_dialog displayCtrl IDC_LEFT_CAMMODE) isEqualTo 2) then {0} else {lbCurSel (_dialog displayCtrl IDC_LEFT_CAMMODE) +1};
          while {!(["cammode", ["FREECAM","INTERNAL","EXTERNAL"] select _camMode] call zade_spectator_fnc_getRestrictions)} do {
               _camMode = if (_camMode isEqualTo 2) then {0} else {_camMode +1}; //_camMode++; it doesn't count over 2 but goes back to 0
          };

          (_dialog displayCtrl IDC_LEFT_CAMMODE) lbSetCurSel _camMode;
          [["FREECAM","INTERNAL","EXTERNAL"] select _camMode] call zade_spectator_fnc_switchCamMode;
          true;
     };
     case (_key in [48]): {  //B - Toggle 3D-Marker
          if !(["3dmarker"] call zade_spectator_fnc_getRestrictions) exitWith {["3D-Markers are disabled.",[1,0.55,0,1]] call zade_spectator_fnc_hint;};

          if (zade_spectator_3dMarker) then {
               ["zade_spectator_3dIcons","onEachFrame"] call BIS_fnc_removeStackedEventHandler;
          } else {
               ["zade_spectator_3dIcons","onEachFrame",zade_spectator_fnc_onDraw3D] call BIS_fnc_addStackedEventHandler;
          };
          zade_spectator_3dMarker = !zade_spectator_3dMarker;
          true;
     };
     case (_key in [82]): {  //0 NUM - Switch in sight
          if (zade_spectator_camMode isEqualTo "INTERNAL") then {
               if (cameraView isEqualTo "GUNNER") then {
                    zade_spectator_target switchCamera "INTERNAL";
               } else {
                    zade_spectator_target switchCamera "GUNNER";
               };
          };
          true;
     };

     default {
         //hintSilent format ["No action for key %1",_key];
     };
};
