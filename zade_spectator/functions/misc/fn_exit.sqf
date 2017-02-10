/*
 * Author: Derzade
 * Exit local spectator
 *
 * Arguments:
 * 0: Unit to switch in (OPTIONAL) If none is given, the unit from which he entered well be used instead
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [] call zade_spectator_fnc_exit;
 *
 * Public: No
 */

params ["_unit",(player getVariable "zade_spectator_oldPlayer")];

closeDialog 0;

//reset cam mode
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

//switch to new unit
selectPlayer _unit;
