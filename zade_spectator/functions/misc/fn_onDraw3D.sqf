/*
 * Author: Derzade
 * Handles all 3D icon drawing
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * NONE
 *
 * Example:
 * n/a
 *
 * Public: No
 */

#include "..\..\idcmacros.hpp"

private _cursorTarget = ([getMousePosition select 0, getMousePosition select 1] call BIS_fnc_getIntersectionsUnderCursor);
private _cursorObject = objNull;
private _cursorName = "";
if (count _cursorTarget > 0) then {_cursorObject = (_cursorTarget select 0) select 3;};

//units
{
     private _distance = _x distance (call zade_spectator_fnc_camera);

     //draw only if cam is 2000m or closer
     if (_distance < 2000) then {
          //icon
          private _icon = if ([_x] call zade_spectator_fnc_isMedic) then {"iconManMedic"} else {"iconMan"};
          if (leader (group _x) isEqualTo _x) then {_icon = "iconManLeader";};
          if ([_x] call zade_spectator_fnc_isUnconscious) then {_icon = "\a3\ui_f\data\igui\cfg\simpletasks\types\heal_ca.paa";};
          if (_distance > 300) then {_icon = "\a3\ui_f\data\map\markers\military\dot_ca.paa";};
          //color
          private _color = [(side _x)] call BIS_fnc_sideColor;
          private _alpha = if (_distance > 1500) then {(2000 - _distance) / 500} else {1};
          _color set [3,_alpha];
          private _position = _x modelToWorldVisual (_x selectionPosition "Head"); _position set [2, (_position select 2) + 0.75];

          drawIcon3D [_icon, _color, _position, 0.75, 0.75, 180, ""];

          //name
          if (_distance < 300) then {
               private _textalpha = if (_distance > 270) then {(300 - _distance) / 30} else {1};
               _color set [3,_textalpha];

               if (_x isEqualTo _cursorObject) then {
                    _cursorName = name _x;
               } else {
                    drawIcon3D ["", [1,1,1,_textalpha], _position, 0, -2.15, 0, name _x, 1.5, 0.035,"RobotoCondensed","center"];
               };
          };
     };
} forEach ([] call zade_spectator_fnc_allUnits);

//dead units
private _dialog = uiNamespace getVariable ["zade_spectator_main",nil];
if (isNil "_dialog") exitWith {};

if (cbChecked (_dialog displayCtrl IDC_LEFT_CHECKBOX)) then {
     {
          private _group = _x;

          //draw onloy if side of group is allowed
          if (["side",side (_group select 0)] call zade_spectator_fnc_getRestrictions) then {
               {
                    private _distance = _x distance (call zade_spectator_fnc_camera);

                    //draw only if cam is 300m or closer
                    if (_distance < 300) then {
                         private _alpha = if (_distance > 270) then {(300 - _distance) / 30} else {1};
                         private _position = _x modelToWorldVisual (_x selectionPosition "Head"); _position set [2, (_position select 2) + 0.75];
                         drawIcon3D ["\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa", [0.1,0.1,0.1,_alpha], _position, 0.75, 0.75, 0, "", 0, pixelH * pixelGrid * 2.5,"RobotoCondensed"];

                         if (_x isEqualTo _cursorObject) then {
                              _cursorName = (_x getVariable "zade_spectator_name");
                         } else {
                              drawIcon3D ["", [1,1,1,_alpha], _position, 0, -2.15, 0, (_x getVariable "zade_spectator_name"), 1.5, 0.035,"RobotoCondensed","center"];
                         };
                    };
               } forEach (_group select 1);
          };
     } forEach zade_spectator_deadUnits;
};

//draw unit under cursor
if !(_cursorName isEqualTo "") then {
     private _position = _cursorObject modelToWorldVisual (_cursorObject selectionPosition "Head"); _position set [2, (_position select 2) + 0.75];
     drawIcon3D ["a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\UnitName_ca.paa", [0,0,0,0.6], _position, 5.5, 3.8, 0, "", 0, 0.035, "PuristaMedium", "center"];
     drawIcon3D ["", [1,1,1,1], _position, 0, -2.15, 0, _cursorName, 1.5, 0.035,"RobotoCondensed","center"];
};

//custom icons
{
      _x params ["_object","_icon","_color","_text","_drawDistance","_size3D","_size2D"];

      private _pos = if (typeName _object isEqualTo "OBJECT") then {getPos _object}else {_object};
      private _distance = _pos distance (call zade_spectator_fnc_camera);
      if (_distance < (_drawDistance select 0)) then {

          //icon itself
           private _alpha = if (_distance > (_drawDistance select 0)*0.95) then {(_distance - (_drawDistance select 0)*0.95) / (_drawDistance select 0)*0.05} else {1};
           _color set [3,_alpha];
           drawIcon3D [_icon, _color, _pos, _size3D, _size3D, 0, "", 0];

           //text
           if (_distance < (_drawDistance select 1)) then {
                private _alpha = if (_distance > (_drawDistance select 1)*0.95) then {(_distance - (_drawDistance select 1)*0.95) / (_drawDistance select 1)*0.05} else {1};
                _color set [3,_alpha];
                drawIcon3D ["", _color, _pos, _size3D, _size3D, 0, _text, 0, pixelH * pixelGrid * 2.5,"RobotoCondensed"];
           };
      };

} forEach zade_spectator_customIcons;
