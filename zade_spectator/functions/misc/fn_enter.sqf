/*
 * Author: Derzade
 * Switches local player into spectator mode. Inializes all variables, the display etc.
 *
 * Arguments:
 * 0: Target <OBJECT> or <POSITION> (Optional)
 * 1: Camera mode <STRING> either "FREECAM", "INTERNAL" or "EXTERNAL" (OPTIONAL)
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [hans,"INTERNAL"] call zade_spectator_fnc_enter;
 *
 * Public: No
 */

params [["_target",([] call zade_spectator_fnc_allUnits) select 0],["_camMode","FREECAM"]];

//Initialize variables
zade_spectator_camera = objNull;
zade_spectator_visionMode = "NORMAL";
zade_spectator_3dMarker = true;

//switch player into curator-unit
_spectator = (createGroup sideLogic) createUnit ["VirtualCurator_F", Position player, [], 0, "FORM"];
_spectaor setVariable ["zade_spectator_oldPlayer", player];
removeAllAssignedItems _spectator;
_spectator enableSimulationGlobal false;
selectPlayer _spectator;


[_target] call zade_spectator_fnc_switchTarget;
[_camMode] call zade_spectator_fnc_switchCamMode;

if ("task_force_radio" in activatedAddons) then {
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
["zade_spectator_3dIcons","onEachFrame",zade_spectator_fnc_onDraw3D] call BIS_fnc_addStackedEventHandler;

addMissionEventHandler ["HandleDisconnect",{call zade_spectator_fnc_loadUnitsTree}];
addMissionEventHandler ["Ended",{hint "lol"; zade_spectator_camera cameraEffect ["Terminate", "back"]; (uiNamespace getVariable 'zade_spectator_main') closeDisplay 1;}];

zade_specator_spectators pushBack player;
publicVariable "zade_specator_spectators";
