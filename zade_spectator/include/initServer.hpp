zade_specator_spectators = [];
publicVariable "zade_specator_spectators";

zade_spectator_spectateableUnits = [];
publicVariable "zade_spectator_spectateableUnits";

//if !(isMultiplayer) then {
     {
          [_x] call zade_spectator_fnc_addSpectateable;
     } forEach allUnits;
//};
