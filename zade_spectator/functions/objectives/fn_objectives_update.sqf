#include "..\..\idcmacros.hpp"

private _disp = uiNamespace getVariable "zade_spectator_main";
private _objectivesGrp = _disp displayCtrl IDC_OBJECTIVES;
private _height = (ctrlPosition _objectivesGrp) select 3;
private _widthUnit = _height / GRID_H * GRID_W;

private _createdCtrls = [];
private _widthSum = 0;

//delete all old controls
while {!(_objectivesGrp controlsGroupCtrl -1 isEqualTo controlNull)} do {
    ctrlDelete (_objectivesGrp controlsGroupCtrl -1);
};

//create new control
{
     private _configPath = _x;
     if (call compile getText(_configPath >> "condition")) then {
          switch (toLower getText (_configPath >> "type")) do {
               case ("progress"): {
                    private _pos = [0, 0, getNumber(_configPath >> "width") * _height, _height];

                    private _grp = _disp ctrlCreate ["RscControlsGroupNoScrollbars",-1, _objectivesGrp];
                    _grp ctrlSetPosition _pos;

                    private _back = _disp ctrlCreate ["zade_spectator_RscTextCenter",-1, _grp];
                    _back ctrlSetPosition _pos;
                    _back ctrlSetBackgroundColor (getArray(_configPath >> "colorBackground"));

                    private _progress = _disp ctrlCreate ["zade_spectator_RscProgress",-1, _grp];
                    _progress ctrlSetPosition _pos;
                    _progress progressSetPosition (call compile getText(_configPath >> "value"));
                    _progress ctrlSetTextColor (getArray(_configPath >> "colorBar"));
                    _progress ctrlSetBackgroundColor (getArray(_configPath >> "colorText"));

                    private _text = _disp ctrlCreate ["zade_spectator_RscTextCenter",-1, _grp];
                    _text ctrlSetPosition _pos;
                    _text ctrlSetTextColor (getArray(_configPath >> "colorText"));
                    _text ctrlSetText (getText(_configPath >> "text"));
                    _text ctrlSetTooltip (getText(_configPath >> "tooltip"));

                    if (call compile getText(_configPath >> "switchVar")) then {
                         {
                              switch (toLower (configName _x)) do {
                                   case ("text"): {
                                        _text ctrlSetText ([_x] call BIS_fnc_returnConfigEntry);
                                   };
                                   case ("colorbar"): {
                                        _progress ctrlSetTextColor ([_x] call BIS_fnc_returnConfigEntry);
                                   };
                                   case ("colortext"): {
                                        _text ctrlSetTextColor ([_x] call BIS_fnc_returnConfigEntry);
                                   };
                                   case ("colorbackground"): {
                                        _back ctrlSetBackgroundColor ([_x] call BIS_fnc_returnConfigEntry);
                                   };
                                   case ("tooltip"): {
                                        _text ctrlSetTooltip ([_x] call BIS_fnc_returnConfigEntry);
                                   };
                              };
                         } forEach (configProperties [((([(missionConfigFile >> "zade_spectator_objectives"),0,true] call BIS_fnc_returnChildren) select 0) >> "switch")]);
                    };

                    _grp ctrlCommit 0;
                    _back ctrlCommit 0;
                    _progress ctrlCommit 0;
                    _text ctrlCommit 0;

                    _createdCtrls pushBack _grp;
               };
               case ("text"): {
                    private _pos = [0, 0, getNumber(_configPath >> "width") * _widthUnit, _height];

                    private _text = _disp ctrlCreate ["zade_spectator_RscTextCenter",-1, _objectivesGrp];
                    _text ctrlSetPosition _pos;
                    _text ctrlSetTextColor (getArray(_configPath >> "colorText"));
                    _text ctrlSetBackgroundColor (getArray(_configPath >> "colorbackground"));
                    _text ctrlSetText (getText(_x >> "text"));
                    _text ctrlSetTooltip (getText(_configPath >> "tooltip"));

                    if (call compile getText(_configPath >> "switchVar")) then {
                         {
                              switch (toLower (configName _x)) do {
                                   case ("text"): {
                                        _text ctrlSetText ([_x] call BIS_fnc_returnConfigEntry);
                                   };
                                   case ("colortext"): {
                                        _text ctrlSetTextColor ([_x] call BIS_fnc_returnConfigEntry);
                                   };
                                   case ("colorbackground"): {
                                        _text ctrlSetBackgroundColor ([_x] call BIS_fnc_returnConfigEntry);
                                   };
                                   case ("tooltip"): {
                                        _text ctrlSetTooltip ([_x] call BIS_fnc_returnConfigEntry);
                                   };
                              };
                         } forEach (configProperties [(_configPath >> "switch")]);
                    };

                    _text ctrlCommit 0;

                    _createdCtrls pushBack _text;
               };
          };
          _widthSum = _widthSum + getNumber(_configPath >> "width");
     };
} forEach ([(missionConfigFile >> "zade_spectator_objectives"),0,true] call BIS_fnc_returnChildren);

_widthSum = _widthSum + (count _createdCtrls - 1) * 0.2;
private _cursor = (((ctrlPosition _objectivesGrp) select 2) - _widthSum * _widthUnit) / 2;
{
     _x ctrlSetPosition [_cursor,0];
     _x ctrlCommit 0;
     _cursor = _cursor + ((ctrlPosition _x) select 2) + 0.2 * _widthUnit;
} forEach _createdCtrls;
