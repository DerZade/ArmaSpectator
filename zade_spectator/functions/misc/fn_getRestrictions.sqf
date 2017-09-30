/*
 * Author: DerZade
 * Returns current setting for specific restriction.
 *
 * Arguments:
 * 0: Type of restriction "side", "cammode" or "3dmarker" <STRING>
 * 1: Element <STRING> or <SIDE> (optional)
 *
 * Return Value:
 * Allowed values for given restriction type or, if elment is given, if the given element is allowed
 *
 * Examples:
 * Spectator is allowed to specatate every side but resistance:
 * ["side"] call zade_spectator_fnc_getRestriction; //will return [east,west,civilian]
 * ["side", resistance] call zade_spectator_fnc_getRestriction; //will return false
 *
 * ["3dmarker"] call zade_spectator_fnc_getRestriction; //will return wether spectator is allowed to see 3D-Markers
 *
 * Public: No
 */

params ["_type","_param"];

private _restrictions = missionNamespace getVariable ["zade_spectatator_restrictions",[[east,west,resistance,civilian],["FREECAM","EXTERNAL","INTERNAL"],true]];

private _return = _restrictions;

switch (tolower _type) do {
     case ("side"): {
          if (isNil "_param") then {
               _return = _restrictions select 0;
          } else {
               _return = call {_param in (_restrictions select 0)};
          };
     };
     case ("cammode"): {
          if (isNil "_param") then {
               _return = _restrictions select 1;
          } else {
               _return = call {_param in (_restrictions select 1)};
          };
     };
     case ("3dmarker"): {
          _return = _restrictions select 2;
     };
};

_return
