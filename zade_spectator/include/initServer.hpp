#include "..\configure.hpp"

zade_specator_spectators = [];
publicVariable "zade_specator_spectators";

zade_spectator_spectateableUnits = [];
publicVariable "zade_spectator_spectateableUnits";

zade_spectator_customIcons = [];
publicVariable "zade_spectator_customIcons";

zade_spectatator_restrictions = [DEF_RESTR_SIDE,DEF_RESTR_CAMMODE,DEF_RESTR_3DMARKER];
publicVariable "zade_spectatator_restrictions";

if (AI_SPECTATEABLE) then {
     {
          if !(isPlayer _x) then {[_x] call zade_spectator_fnc_addSpectateable;};
     } forEach allUnits;
};
