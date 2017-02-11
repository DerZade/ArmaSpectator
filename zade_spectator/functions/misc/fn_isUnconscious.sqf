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

params ["_unit"];

(_unit getVariable ["ACE_isUnconscious", false] || lifeState _unit == "INCAPACITATED"])
