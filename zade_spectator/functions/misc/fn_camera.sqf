/*
 * Author: DerZade
 * Return current camera object
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * Camera
 *
 * Example:
 * [] call zade_spectator_fnc_camera;
 *
 * Public: No
 */

if (zade_spectator_cammode isEqualTo "INTERNAL") then {
     zade_spectator_target
} else {
     zade_spectator_camera
};
