/*
 * Author: Derzade
 * Main KeyUp-EH of the UI
 *
 * Arguments:
 * 0: What restriction <STRING> ("side","cammode","3dmarker")
 * 1: Params <ARRAY> (differs between types see below)
 *
 * Return Value:
 * NONE
 *
 * Public: No
 *
 * Params for restriction "side":
 *   To (dis-)allow a single side       ["side",[east,false]] call zade_spectator_fnc_setRestrictions;
 *        0: Side <SIDE>                //the restriction in the first place + east ist disallowed
 *        1: Allow? <BOOL>
 *   To (dis-)allow multiple side       ["side",[[east,west],true]] call zade_spectator_fnc_setRestrictions;
 *        0: Sides <ARRAY>              //additionally to whatever the restriction was set to in the first place east and west are allowed
 *        1: Allow? <BOOL>
 *   To simply set the restriction      ["side",[[east,west]]] call zade_spectator_fnc_setRestrictions;
 *        0: Allowed sides <ARRAY>     //East and West are allowed
 *
 * Params for restriction "cammode":
 *   Simular to restriction "side"
 *
 * Params for restriction "3dmarker":
 *   0: Allow 3D-Markers <BOOL>
 *   ["3dmarker",[false]] call zade_spectator_fnc_setRestrictions; //3D-Markers are disabled
 */

params ["_type","_params"];

private _restrictions = +(missionNamespace getVariable ["zade_spectatator_spectator",[[east,west,resistance,civilian],["FREECAM","EXTERNAL","INTERNAL"],true]]);

switch (tolower _type) do {
    case ("side"): {
          if (count _params > 1) then {
               _params params ["_sides","_allow"];
               if (_allow) then {
                    if (typeName _sides isEqualTo "ARRAY") then {
                    //allow multiple sides
                         {
                              (_restrictions select 0) pushBackUnique _x;
                         } forEach _sides;
                    } else {
                    //allow single side
                         (_restrictions select 0) pushBackUnique _sides;
                    };
               } else {
                    if (typeName _sides isEqualTo "ARRAY") then {
                    //disallow multiple sides
                         {
                              (_restrictions select 0) deleteAt ((_restrictions select 0) find _x);
                         } forEach _sides;
                    } else {
                    //disallow single side
                         (_restrictions select 0) deleteAt ((_restrictions select 0) find _sides);
                    };
               };
          } else {
               _restrictions set [0,(_params select 0)];
          };
    };
    case ("cammode"): {
         if (count _params > 1) then {
              _params params ["_camModes","_allow"];
              if (_allow) then {
                   if (typeName _camModes isEqualTo "ARRAY") then {
                   //allow multiple sides
                        {
                             (_restrictions select 1) pushBackUnique _x;
                        } forEach _camModes;
                   } else {
                   //allow single side
                        (_restrictions select 1) pushBackUnique _camModes;
                   };
              } else {
                   if (typeName _camModes isEqualTo "ARRAY") then {
                   //disallow multiple sides
                        {
                             (_restrictions select 1) deleteAt ((_restrictions select 1) find _x);
                        } forEach _camModes;
                   } else {
                   //disallow single side
                        (_restrictions select 1) deleteAt ((_restrictions select 1) find _camModes);
                   };
              };
         } else {
              _restrictions set [1,(_params select 0)];
         };
    };
    case ("3dmarker"): {
         _restrictions set [2,(_params select 0)];

         if (_params select 0) then {
             if !(zade_spectator_3dMarker) then {["3D-Markers enabled.",[1,0.55,0,1]] call zade_spectator_fnc_hint;};
         } else {
              ["3D-Markers are disabled.",[1,0.55,0,1]] call zade_spectator_fnc_hint;
              if (zade_spectator_3dMarker) then {
                   ["zade_spectator_3dIcons","onEachFrame"] call BIS_fnc_removeStackedEventHandler;
              };
         };
    };
};

zade_spectatator_spectator = _restrictions;
