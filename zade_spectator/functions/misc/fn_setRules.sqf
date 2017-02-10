/*
 * Author: Derzade
 * onMouseZChanged-EH
 *
 * Arguments:
 * 0: Value <STING> ("cameraMode" or "side")
 * 1: Parmas <ARRAY>
 *        "cameramode" : [(dis)allow <BOOL>, cammode(s) <STRING> / <ARRAY>]
 *        "side" : [(dis)allow <BOOL>, side(s) <SIDE> / <ARRAY>]
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_onMouseZChanged;
 *
 * Public: No
 */
params ["_value","_params"];

switch (toLower _value) do {
     case ("cameramode"): {
         _params params ["_allow","_modes"];
         if (typeName _modes == "STRING") then {_modes = [_modes];};
         params _allowedModes = +(missionNamespace getVariable ["zade_spectator_allowedCamMode",["FREECAM","INTERNAL","EXTERNAL"]]);

         if (_allow) then {
              {
                   _allowedModes pushBackUnique _x;
              } forEach _modes;
         } else {
               {
                   private _index = _allowedModes find _x;
                   if !(_x isEqualTo -1) then {
                       _allowedModes deleteAt _index;
                   };
               } forEach _modes;
         };
         zade_spectator_allowedCamMode = _allowedModes;
         publicVariable "zade_spectator_allowedCamMode";
     };
     case ("side"): {
         _params params ["_allow","_sides"];
         if (typeName _sides == "STRING") then {_sides = [_sides];};
         params _allowedSides = +(missionNamespace getVariable ["zade_spectator_allowedSides",[west,east,resistance,civilian]]);

         if (_allow) then {
              {
                   _allowedSides pushBackUnique _x;
              } forEach _sides;
         } else {
               {
                   private _index = _allowedSides find _x;
                   if !(_x isEqualTo -1) then {
                       _allowedSides deleteAt _index;
                   };
               } forEach _sides;
         };
         zade_spectator_allowedSides = _allowedSides;
         publicVariable "zade_spectator_allowedSides";
     };
};
