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
