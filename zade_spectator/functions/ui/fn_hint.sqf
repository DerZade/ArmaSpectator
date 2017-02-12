params ["_text",["_color",[1,1,1,1]]];

("zade_spectator_hint" call BIS_fnc_rscLayer) cutRsc ["zade_spectator_hint","PLAIN"];

waitUntil {! isNull (uiNamespace getVariable ['zade_spectator_hint',displayNull])};
private _disp = uiNamespace getVariable ['zade_spectator_hint',displayNull];

(_disp displayCtrl 1) ctrlSetText _text;
(_disp displayCtrl 1) ctrlSetTextColor _color;

//hide hint if ui is hidden
if (ctrlShown ((uiNamespace getVariable 'zade_spectator_main') displayCtrl 1)) then {
     (_disp displayCtrl 1) ctrlSetFade 1;
}
