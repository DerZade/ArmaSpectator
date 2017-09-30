/*
 * Author: DerZade
 * Find in pairs (BIS_fnc_findInPairs only works with Stings)
 *
 * Arguments:
 * 0: Array to search in <ARRAY>
 * 1: Key to search for <ANYTHING>
 *
 * Return Value:
 * Index of first pair element, in which the key was found
 *
 * Example:
 * [[[1,"ImAString"],[42,"TheAnswerToAnything"],[42,player]],player] call zade_spectator_fnc_findInPairs; //returns 2
 *
 * Public: No
 */

params ["_array","_key"];

private _index = -1;

{
     if (_x find _key != -1) exitWith {_index = _forEachIndex};
} forEach _array;

_index
