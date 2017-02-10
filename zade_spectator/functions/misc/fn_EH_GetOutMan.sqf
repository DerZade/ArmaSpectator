params ["_unit","_pos","_vehicle","_turret"];

//update the unit tree of all spectators
[[[_unit], {
     if (((_this select 0) isEqualTo zade_spectator_target) and (zade_spectator_cammode isEqualTo "EXTERNAL")) then {
          zade_spectator_camera camSetTarget zade_spectator_target;
     };
     call zade_spectator_fnc_loadUnitsTree;
}] ,"BIS_fnc_call", zade_specator_spectators] call BIS_fnc_MP;
