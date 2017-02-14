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

//units
#include "..\..\idcmacros.hpp"
{
     private _distance = _x distance (call zade_spectator_fnc_camera);

     //draw only if cam is 2000m or closer
     if (_distance < 2000) then {
          //icon
          private _icon = if ([_x] call zade_spectator_fnc_isMedic) then {"iconManMedic"} else {"iconMan"};
          if (leader (group _x) isEqualTo _x) then {_icon = "iconManLeader";};
          if ([_x] call zade_spectator_fnc_isUnconscious) then {_icon = "\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa";};

          //color
          private _color = [(side _x)] call BIS_fnc_sideColor;;
          private _alpha = if (_distance > 1500) then {(2000 - _distance) / 500} else {1};
          _color set [3,_alpha];

          drawIcon3D [_icon, _color, getPos _x, 0.65, 0.65, 0, "", 0];

          //name
          if (_distance < 300) then {
               private _textalpha = if (_distance > 270) then {(300 - _distance) / 30} else {1};
               _color set [3,_textalpha];

               drawIcon3D ["", _color, getPos _x, 0.65, 0.65, 0, name _x, 0, pixelH * pixelGrid * 2.5,"RobotoCondensed"];
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
          if (side (_group select 0) in (missionNamespace getVariable ["zade_spectator_allowedSides",[west,east,resistance,civilian]])) then {
               {
                    private _distance = _x distance (call zade_spectator_fnc_camera);

                    //draw only if cam is 300m or closer
                    if (_distance < 300) then {
                         private _alpha = if (_distance > 270) then {(300 - _distance) / 30} else {1};
                         drawIcon3D ["\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa", [0.1,0.1,0.1,_alpha], getPos _x, 0.5, 0.5, 0, (_x getVariable "zade_spectator_name"), 0, pixelH * pixelGrid * 2.5,"RobotoCondensed"];
                    };
               } forEach (_group select 1);
          };
     } forEach zade_spectator_dead;
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
