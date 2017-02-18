/*
 * Author: Derzade
 * Splits given string str into an array of tokens according to given seperator.
 * This functions only exists because BI's functions doesn't support a seperator with multiple char
 *
 * Arguments:
 * 0: String to split <STRING>
 * 1: Seperator <STRING>
 *
 * Return Value:
 * String parts <ARRAY>
 *
 * Example:
 * ["SQF syntax is nuts","n"] call zade_spectator_fnc_splitString;
 * Returns: ["SQF sy","tax is ","uts"]
 *
 * Public: No
 */

params ["_string","_seperator"];
private _return = [];
private _cutString = _string;
while {_cutString find _seperator > -1} do {
     private _i = _cutString find _seperator;
     if !(_i isEqualTo 0) then {_return pushBack ([_cutString, 0, _i-1] call BIS_fnc_trimString);};
     if (_i isEqualTo (count _cutString) - 1) then {
          _cutString = "";
     } else {
          _cutString = [_cutString, _i + count _seperator] call BIS_fnc_trimString;
     };
};

if !(_cutString isEqualTo "") then {
     _return pushBack _cutString;
};

_return
