/*
 * Author: Derzade
 * Triggerd by the 'onLoad'-EH of TFAR display
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_TFARonLoad;
 *
 * Public: No
 */
params ["_disp"];

if (isNil "zade_spectator_TFARSpectator") exitWith {
     for "_i" from 1 to 2 do {
          (_disp displayCtrl _i) ctrlSetFade 0.8;
          (_disp displayCtrl _i) ctrlCommit 0;
     };
     (_disp displayCtrl 3) ctrlSetText "TFAR is disabled";
};

if (zade_spectator_TFARSpectator) then {
     (_disp displayCtrl 2) ctrlSetFade 0.8;
     (_disp displayCtrl 2) ctrlCommit 0;
     (_disp displayCtrl 3) ctrlSetText "Spectator-Channel";
} else {
     (_disp displayCtrl 1) ctrlSetFade 0.8;
     (_disp displayCtrl 1) ctrlCommit 0;
     (_disp displayCtrl 3) ctrlSetText "Comms-Channel";
};
