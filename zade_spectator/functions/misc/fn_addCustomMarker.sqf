/*
 * Author: DerZade
 * Add a custom marker
 *
 * Arguments:
 * 0: Object Marker should be attached to <OBJECT>
 * 1: Icon <STRING> (optional | default: "")
 * 2: Color <COLOR RGBA> (optional | default: [1,1,1,1])
 * 3: Text <STRING> (optional | default: "")
 * 4: 3D Max Drawdistance <ARRAY> [Marker Max, Text Max] (optional | default: [3000,500])
 * 5: 3D marker size <NUMBER> (optional | default: 0.65)
 * 6: 2D marker size (Map) <NUMBER> (optional | default: 24)
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [] call zade_spectator_fnc_addCustomMarker;
 *
 * Public: No
 */
 
params ["_object",["_icon",""],["_color",[1,1,1,1]],["_text",""],["_drawDistance",[3000,500]],["_size3D",0.65],["_size2D",24]];

zade_spectator_customIcons pushBack [_object,_icon,_color,_text,_drawDistance,_size3D,_size2D];
publicVariable "zade_spectator_customIcons";
