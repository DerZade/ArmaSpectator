#include "..\configure.hpp"

if (PLAYER_SPECTATEABLE) then {
     [(_this select 0)] call zade_spectator_fnc_addSpectateable;
};
