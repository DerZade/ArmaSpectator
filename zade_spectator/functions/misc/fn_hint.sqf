/*
 * Author: DerZade
 * Displays hint for local spectator.
 *
 * Arguments:
 * 0: Text to display <STRING>
 * 1: Color <COLOR RGBA> (optional | default: [1,1,1,1])
 *
 * Return Value:
 * NONE
 *
 * Examples:
 * ["You suck, because you died looser!!!111",[1,1,0,1]] call zade_spectator_fnc_hint;
 *
 * Public: No
 */

#include "..\..\idcmacros.hpp"

params ["_text",["_color",[1,1,1,1]]];

("zade_spectator_hint" call BIS_fnc_rscLayer) cutRsc ["zade_spectator_hint","PLAIN"];

waitUntil {! isNull (uiNamespace getVariable ['zade_spectator_hint',displayNull])};
private _disp = uiNamespace getVariable ['zade_spectator_hint',displayNull];

(_disp displayCtrl IDC_HINT_TEXT) ctrlSetText _text;
(_disp displayCtrl IDC_HINT_TEXT) ctrlSetTextColor _color;

//hide hint if ui is hidden
if !(ctrlShown ((uiNamespace getVariable 'zade_spectator_main') displayCtrl IDC_LEFTPANEL)) then {
     (_disp displayCtrl IDC_HINT_TEXT) ctrlSetFade 1;
     (_disp displayCtrl IDC_HINT_TEXT) ctrlCommit 0;
}
