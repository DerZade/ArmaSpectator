/*
 * Author: Derzade
 * onLoad of listboxes in the controls.
 *
 * Arguments:
 * 0: List <CONTROL>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_onLoad_controlsList;
 *
 * Public: No
 */
#include "..\..\idcmacros.hpp"
params ["_listbox",["_type",""]];

_listbox ctrlEnable false;

if (_type isEqualTo "") then {
     _type = switch (ctrlIDC _listbox) do {case IDC_CONTROLS_GENERAL_LIST: {"general"};case IDC_CONTROLS_FREECAM_LIST: {"camera_freecam"};case IDC_CONTROLS_EXTERNAL_LIST: {"camera_external"};case IDC_CONTROLS_INTERNAL_LIST: {"camera_internal"};};
};

private _displayname = {if (count (actionKeys _this) > 1) then {([actionKeysNames _this," or "] call zade_spectator_fnc_splitString) joinString ", "} else {actionKeysNames _this}};

_rows = switch (tolower _type) do {
     case ("general"): {
          [
          [localize "str_3den_display3den_menubar_search_text",format ['"%1+%2", %3',toString (toArray keyName 29 - [34]),toString (toArray keyName 33 - [34]), keyName 61]],
          [format ["%1*",actionName "CameraInterface"] , "CameraInterface" call _displayname],
          [localize "str_3den_display3den_menubar_options_text",keyName 59],
          [localize "str_3den_display3den_menubar_map_text",keyName 50],
          ['Toggle Camera-Mode',keyName 46],
          [format ["%1*",actionName "CameraVisionMode"], "CameraVisionMode" call _displayname],
          ['Toggle 3D-Markers',keyName 48],
          [format ["%1*",actionName "CameraTarget"], "CameraTarget" call _displayname],
          ['Toggle TFAR',keyName 20]
          ]
     };
     case ("camera_internal"): {
          [
          [localize "str_a3_zooming1",keyName 82]
          ]
     };
     case ("camera_freecam"): {
          [
          [format ["%1*",actionName "CameraMoveForward"], "CameraMoveForward" call _displayname],
          [format ["%1*",actionName "CameraMoveBackward"], "CameraMoveBackward" call _displayname],
          [format ["%1*",actionName "CameraMoveLeft"], "CameraMoveLeft" call _displayname],
          [format ["%1*",actionName "CameraMoveRight"], "CameraMoveRight" call _displayname],
          [format ["%1*",actionName "CameraMoveUp"], "CameraMoveUp" call _displayname],
          [format ["%1*",actionName "CameraMoveDown"], "CameraMoveDown" call _displayname],
          [format ["%1*",actionName "CameraMoveTurbo1"], "CameraMoveTurbo1" call _displayname],
          [format ["%1*",actionName "CameraMoveTurbo2"], "CameraMoveTurbo2" call _displayname]
          ]
     };
     case ("camera_external"): {
          [
          [actionName "CameraMoveForward", '"Mouse wheel up"'],
          [actionName "CameraMoveBackward", '"Mouse wheel down"'],
          [actionName "CameraMoveLeft", '"Sec. Mouse Btn. + Mouse right"'],
          [actionName "CameraMoveRight", '"Sec. Mouse Btn. + Mouse left"'],
          [actionName "CameraMoveUp", '"Sec. Mouse Btn. + Mouse down"'],
          [actionName "CameraMoveDown", '"Sec. Mouse Btn. + Mouse up"']
          ]
     };
};


//GENERAL CONTROLS
lnbClear _listbox;
{
     _listbox lnbAddRow _x;
} forEach _rows
