/*
 * Author: Derzade
 * Returns whether a unit is a unconscious
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Is Medic ? <BOOL>
 *
 * Example:
 * [player] call zade_spectator_fnc_isUnconscious;
 *
 * Public: No
 */
#include "..\..\configure.hpp"
params ["_unit"];

private _return = (incapacitatedState _unit) isEqualTo "UNCONSCIOUS";

if (ACE_ENABLED) then {
     _return = _unit getVariable ["ace_isunconscious", false];
};

_return
