/*
 * Author: Derzade
 * Switches local player into spectator mode. Inializes all variables, the display etc.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Camera mode <STRING> either "FREECAM", "INTERNAL" or "EXTERNAL" (OPTIONAL)
 *
 * Return Value:
 * Spectator Unit <OBJECT>
 *
 * Example:
 * _spectatorUnit = [hans,"INTERNAL"] call zade_spectator_fnc_enter;
 *
 * Public: No
 */
#include "..\..\configure.hpp"
params [["_target",([] call zade_spectator_fnc_allUnits) select 0],["_camMode",(["cammode"] call zade_spectator_fnc_getRestrictions) select 0]];

//Initialize variables
zade_spectator_camera = objNull;
zade_spectator_visionMode = "NORMAL";
zade_spectator_camMode = "";
zade_spectator_3dMarker = true;

//switch player into curator-unit
_spectator = (createGroup sideLogic) createUnit ["VirtualCurator_F", Position player, [], 0, "FORM"];
_spectator setVariable ["zade_spectator_oldPlayer", player, true];
removeAllAssignedItems _spectator;
_spectator enableSimulationGlobal false;
selectPlayer _spectator;


[_target] call zade_spectator_fnc_switchTarget;
[_camMode] call zade_spectator_fnc_switchCamMode;

if (TFAR_ENABLED) then {
     //set TFAR into spectator mode
     zade_spectator_TFARSpectator = false;
     [] call zade_spectator_fnc_toogleTFAR;

     //mute player
     _spectator setVariable ["tf_voiceVolume", 0, true];
     _spectator setVariable ["tf_globalVolume", 0, true];
     _spectator setVariable ["tf_unable_to_use_radio", true, true];
};

//open display
[] spawn {
     disableSerialization;
     waitUntil {!isNull ([] call BIS_fnc_displayMission)};
     ([] call BIS_fnc_displayMission) createDisplay "zade_spectator_main";
};

//draw 3D Icons
if (["3dmarker"] call zade_spectator_fnc_getRestrictions) then {
     ["zade_spectator_3dIcons","onEachFrame",zade_spectator_fnc_onDraw3D] call BIS_fnc_addStackedEventHandler;
} else {
     zade_spectator_3dMarker = false;
};

private _i1 = addMissionEventHandler ["HandleDisconnect",{call zade_spectator_fnc_loadUnitsTree}];
private _i2 = addMissionEventHandler ["Ended",{zade_spectator_camera cameraEffect ["Terminate", "back"]; (uiNamespace getVariable 'zade_spectator_main') closeDisplay 1;}];
_spectator setVariable ["zade_spectator_missionEHs",[_i1,_i2], true];

zade_specator_spectators pushBack _spectator;
publicVariable "zade_specator_spectators";

_spectator
