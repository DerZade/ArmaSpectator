/*
 * Author: DerZade
 * Triggerd by the 'onLoad'-EH of TFAR display
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _this call zade_spectator_fnc_TFAR_onLoad;
 *
 * Public: No
 */

#include "..\..\idcmacros.hpp"

params ["_disp"];

if (isNil "zade_spectator_TFARSpectator") exitWith {
     for "_i" from 1 to 2 do {
          (_disp displayCtrl _i) ctrlSetFade 0.8;
          (_disp displayCtrl _i) ctrlCommit 0;
     };
     (_disp displayCtrl IDC_TFAR_DESC) ctrlSetText "TFAR is disabled";
};

if (zade_spectator_TFARSpectator) then {
     (_disp displayCtrl IDC_TFAR_VOICE) ctrlSetFade 0.8;
     (_disp displayCtrl IDC_TFAR_VOICE) ctrlCommit 0;
     (_disp displayCtrl IDC_TFAR_DESC) ctrlSetText "Spectator-Channel";
} else {
     (_disp displayCtrl IDC_TFAR_SPEC) ctrlSetFade 0.8;
     (_disp displayCtrl IDC_TFAR_SPEC) ctrlCommit 0;
     (_disp displayCtrl IDC_TFAR_DESC) ctrlSetText "Comms-Channel";
};
