/*
 * Author: Derzade
 * Return all spectetable units depending on which sides the spectator is allowed to spectate
 *
 * Arguments:
 * 0: Side <SIDE> (Optional)
 *
 * Return Value:
 * Spectetable units
 *
 * Example:
 * [] call zade_spectator_fnc_allUnits;
 *
 * Public: No
 */
params [["_side",sideUnknown]];

private _units = [];

{
     //unit has to be in a allowed side
     if (["side",side _x] call zade_spectator_fnc_getRestrictions) then {
          if (alive _x) then { //unit has to be alive
               if ((_side isEqualTo sideUnknown) or (_side isEqualTo (side _x))) then {_units pushBack _x};
          };
     };
} forEach zade_spectator_spectateableUnits;

_units
