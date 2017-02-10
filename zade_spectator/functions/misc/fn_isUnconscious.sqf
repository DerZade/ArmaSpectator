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

((unitPos _unit) isEqualTo "Down")
