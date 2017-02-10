/*
 * Author: Derzade
 * Returns whether a unit is a medic
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Is Medic ? <BOOL>
 *
 * Example:
 * [player] call zade_spectator_fnc_isMedic;
 *
 * Public: No
 */

params [["_unit", objNull]];

(typeOf _unit in ["B_medic_F","O_medic_F","I_medic_F"])
