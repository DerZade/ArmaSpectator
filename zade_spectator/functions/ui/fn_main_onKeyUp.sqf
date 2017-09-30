/*
 * Author: DerZade
 * Main KeyUp-EH of the UI
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

disableSerialization;

params ["_dialog","_key","_shift","_ctrl","_alt"];

//make sure the user isn't typing in the search field
if (missionNamespace getVariable ["zade_spectator_editFocused",false]) exitWith {};

switch (true) do {
     case (_key in actionKeys "CameraMoveTurbo2"): { //LALT - Speed
         if (zade_spectator_cammode isEqualTo "FREECAM") then {
               zade_spectator_camera camCommand "speedDefault 0.1";
               zade_spectator_camera camCommand "speedBoost 1.0";
               true;
         };
     };
};
