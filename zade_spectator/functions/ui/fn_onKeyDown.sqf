/*
 * Author: Derzade
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
 * _this call zade_spectator_fnc_onKeyDown;
 *
 * Public: No
 */
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
          if (ctrlShown (_dialog displayCtrl 1)) then {
               //show fake panel
               (_dialog displayCtrl 5) ctrlShow true;
               (_dialog displayCtrl 5) ctrlSetFade (ctrlFade (_dialog displayCtrl 1)); //apply same fade
               (_dialog displayCtrl 5) ctrlCommit 0;

               //hide panel
               (_dialog displayCtrl 1) ctrlSetFade 1;
               (_dialog displayCtrl 1) ctrlCommit 0.2;
               _null = [(_dialog displayCtrl 1)] spawn {disableSerialization; sleep 0.2; (_this select 0) ctrlShow false;};
          } else {
               //show panel
               (_dialog displayCtrl 1) ctrlShow true;
               (_dialog displayCtrl 1) ctrlSetFade (ctrlFade (_dialog displayCtrl 5)); //apply same fade
               (_dialog displayCtrl 1) ctrlCommit 0.2;

               //show hint if there is one currently open
               private _display = uiNamespace getVariable ['zade_spectator_hint',nil];
               if (!isNil "_display") then {
                    (_display displayCtrl 1) ctrlSetFade 0;
               };

               //hide search results
               if (ctrlText (_dialog displayCtrl 12) isEqualTo "") then {
                    (_dialog displayCtrl 15) ctrlShow false;
               } else {
                    (_dialog displayCtrl 14) ctrlShow false;
               };

               //hide fake panel
               (_dialog displayCtrl 5) ctrlShow false;

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
          if (ctrlShown (_dialog displayCtrl 2)) exitWith {
               (_dialog displayCtrl 2) ctrlShow false; true;
          };
          if (ctrlShown (_dialog displayCtrl 3)) exitWith {
               (_dialog displayCtrl 3) ctrlShow false; true;
          };

          private _displayType = if (isMultiplayer) then { "RscDisplayMPInterrupt" } else { "RscDisplayInterrupt" };
          _dialog createDisplay _displayType;

          ((findDisplay 49) displayCtrl 103) ctrlEnable false;
          ((findDisplay 49) displayCtrl 119) ctrlEnable false;
          ((findDisplay 49) displayCtrl 104) ctrlSetEventHandler ["buttonClick", "['end1',false,0] call BIS_fnc_endMission;"];
          true;
     };
     case (_key in [59]): { //F1 - Toogle Controls

          if (ctrlShown (_dialog displayCtrl 3)) then {
               //hide controls
               (_dialog displayCtrl 3) ctrlShow false;
          } else {
               //show controls
               (_dialog displayCtrl 3) ctrlShow true;
               {(_dialog displayCtrl _x) ctrlShow false;} forEach [36,37,38];
               (_dialog displayCtrl (36+(lbCurSel (_dialog displayCtrl 39)))) ctrlShow true;
          };
          true;
     };
     case (_key in [61]): { //F3 - Search

          //focus search edit
          ctrlSetFocus (_dialog displayCtrl 12);

          //show panel
          if !(ctrlFade (_dialog displayCtrl 1) isEqualTo 0) then {
               (_dialog displayCtrl 1) ctrlSetFade 0;
               (_dialog displayCtrl 1) ctrlCommit 0;
          };
          true;
     };

     case (_key in [33]): { //F - (+ CTRL) Search

          if (_ctrl and !_shift and !_alt) then {
               //focus search edit
               ctrlSetFocus (_dialog displayCtrl 12);

               //show panel
               if !(ctrlFade (_dialog displayCtrl 1) isEqualTo 0) then {
                    (_dialog displayCtrl 1) ctrlSetFade 0;
                    (_dialog displayCtrl 1) ctrlCommit 0;
               };
          };
          true;
     };

     case (_key in [50]): { //M - Toggle map
          if (ctrlShown (_dialog displayCtrl 2)) then {
               //hide map
               (_dialog displayCtrl 2) ctrlShow false;
          } else {
               //center map on camera
               (_dialog displayCtrl 23) ctrlMapAnimAdd [0, 0.05, (call zade_spectator_fnc_camera)];
               ctrlMapAnimCommit (_dialog displayCtrl 23);

               //show map
               (_dialog displayCtrl 2) ctrlShow true;
          };
          true;
     };
     case (_key in [20]): { //T - Toggle TFAR

          [] call zade_spectator_fnc_toggleTFAR;
          true;
     };
     case (46): { //C - Cycle cammode
          private _camMode = (["EXTERNAL","FREECAM","INTERNAL"] find zade_spectator_camMode);
          if (_ctrl) then {
               _camMode = (["INTERNAL","EXTERNAL","FREECAM"] find zade_spectator_camMode);
          };
          (_dialog displayCtrl 17) lbSetCurSel _camMode;
          [(["FREECAM","INTERNAL","EXTERNAL"] select _camMode)] call zade_spectator_fnc_switchCamMode;
          true;
     };
     case (_key in [48]): {  //B - Toggle 3D-Marker
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
         hintSilent format ["No action for key %1",_key];
     };
};
