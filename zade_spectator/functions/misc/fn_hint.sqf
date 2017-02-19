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
