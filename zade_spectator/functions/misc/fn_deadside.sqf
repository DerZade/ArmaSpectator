params ["_unit"];

{
     private _units = _x select 1;
     private _curside = side (_x select 0);
     {
          if (_unit == _x) exitWith {_curside};
     } forEach _units;
} forEach zade_spectator_dead;

sideUnknown
