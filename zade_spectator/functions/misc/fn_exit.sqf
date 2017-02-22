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
#include "..\..\configure.hpp"
params [["_unit",(player getVariable "zade_spectator_oldPlayer")]];
private _spectator = player;
//reset cam mode
switch (zade_spectator_camMode) do {
     case ("INTERNAL"): {
          _spectator switchCamera "INTERNAL";
     };
     case ("EXTERNAL"): {
          ["zade_spectator_updateExternalCam","onEachFrame"] call BIS_fnc_removeStackedEventHandler;
          zade_spectator_camera cameraEffect ["Terminate", "back"];
     };
     case ("FREECAM"): {
          zade_spectator_camera cameraEffect ["Terminate", "back"];
     };
};

//close display
(uiNamespace getVariable 'zade_spectator_main') closeDisplay 1;
uiNamespace setVariable ['zade_spectator_main',nil];

//remove stacked EH for 3D-Markers
["zade_spectator_3dIcons","onEachFrame"] call BIS_fnc_removeStackedEventHandler;

removeMissionEventHandler ["HandleDisconnect", (_spectator getVariable "zade_spectator_missionEHs") select 0];
removeMissionEventHandler ["Ended", (_spectator getVariable "zade_spectator_missionEHs") select 1];

//remove from spectators list
zade_specator_spectators deleteAt (zade_specator_spectators find _spectator);
publicVariable "zade_specator_spectators";


//switch to new unit
showHUD [true,true,true,true,true,true,true,true,false,false];
selectPlayer _unit;
_unit switchCamera "INTERNAL";
deleteVehicle _spectator;

if (TFAR_ENABLED) then {
     [_unit, false] call TFAR_fnc_forceSpectator;
};
