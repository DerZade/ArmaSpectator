/*
 * Author: DerZade
 * Toggle TFAR Spectator mode of local spectator
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [] call zade_spectator_fnc_toogleTFAR;
 *
 * Public: No
 */

if (isNil "zade_spectator_TFARSpectator") exitWith {["TFAR is disabled.",[1,0.55,0,1]] call zade_spectator_fnc_hint;};

private _new = ! zade_spectator_TFARSpectator;

//update var
zade_spectator_TFARSpectator = _new;


//update TFAR shit
[player, _new] call TFAR_fnc_forceSpectator;

//show display
("zade_spectator_TFAR" call BIS_fnc_rscLayer) cutRsc ["zade_spectator_TFAR","PLAIN"];
