class background : zade_spectator_RscText
{
     x = 0;
     y = 0;
     w = LEFTPANEL_W * GRID_W;
     h = 1 * safezoneH;
     colorBackground[] = {0,0,0,0.5};
     onLoad = "_this spawn {sleep 0.02; (_this select 0) ctrlShow true;};"; //fixes a background-not-shown issue
};
class side: zade_spectator_RscToolbox
{
     idc = IDC_LEFT_SIDE;
     x = 1 * GRID_W;
     y = 1 * GRID_H;
     w = (LEFTPANEL_W - 2) * GRID_W;
     h = 12 * GRID_H;
     columns=4;
     strings[]={"a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa","a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa","a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa","a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa"};
     values[]={0,1,2,3};
     onToolBoxSelChanged = "[] call zade_spectator_fnc_loadUnitsTree;";
};
class searchEdit : zade_spectator_RscEdit
{
     idc = IDC_LEFT_EDIT;
     x = 2 * GRID_W;
     y = 14 * GRID_H;
     w = (LEFTPANEL_W - 5 - 5.5 * 3) * GRID_W;
     h = 5.5 * GRID_H;
     onKeyUp = "_this call zade_spectator_fnc_search_onKeyUp;";
     onSetFocus = "zade_spectator_editFocused = true;";
     onKillFocus = "zade_spectator_editFocused = false;";
};
class searchButton : zade_spectator_RscButton
{
     idc = IDC_LEFT_SEARCH;
     style = 0x02 + 0x30 + 0x800;
     x = (LEFTPANEL_W - 3 - 5.5 * 3) * GRID_W;
     y = 14 * GRID_H;
     w = 5.5 * GRID_W;
     h = 5.5 * GRID_H;
     text = "\a3\3den\data\displays\display3den\search_start_ca.paa";
     onButtonClick = "_this call zade_spectator_fnc_search_onButtonClick;";
};
class collapse : searchButton
{
     x = (LEFTPANEL_W - 2 - 5.5 * 2) * GRID_W;
     colorBackground[] = {0,0,0,0};
     text = "\a3\3den\data\displays\display3den\tree_collapse_ca.paa";
     onButtonClick = "_this call zade_spectator_fnc_collapseTree_onButtonClick;";
};
class expand : collapse
{
     x = (LEFTPANEL_W - 2 - 5.5 * 1) * GRID_W;
     text = "\a3\3den\data\displays\display3den\tree_expand_ca.paa";
     onButtonClick = "_this call zade_spectator_fnc_expandTree_onButtonClick;";
};
class tree: zade_spectator_RscTree
{
     idc = IDC_LEFT_TREE;
     onSetFocus = QUOTE(_this spawn {sleep 0.01; ctrlSetFocus ((ctrlParent (_this select 0)) displayCtrl IDC_FOCUSBUTTON);};);
     onTreeDblClick = "_this call zade_spectator_fnc_onTreeDblClick;";
     onTreeSelChanged = "params ['_ctrl','_path'];if (_path isEqualTo [-1]) exitWith {};_ctrl tvSetCurSel [-1];";
     x = 0;
     y = 20.5 * GRID_H;
     w = LEFTPANEL_W  * GRID_W;
     h = safezoneH - (20.5 + 23) * GRID_H;
};
class tree_searchResults: tree
{
     idc = IDC_LEFT_RESULTS;
     show = 0;
};
class showDeadCheckBox : zade_spectator_RscCheckbox
{
     idc = IDC_LEFT_CHECKBOX;
     checked = 1;
     x = 5 * GRID_W;
     y = safezoneH - 22 * GRID_H;
     w = 5.5 * GRID_W;
     h = 5.5 * GRID_H;
     onCheckedChanged = "[] call zade_spectator_fnc_loadUnitsTree;";
};
class showDeadText : zade_spectator_RscText
{
     x = 10 * GRID_W;
     y = safezoneH - 22 * GRID_H;
     w = (LEFTPANEL_W - 12) * GRID_W;
     h = 5.5 * GRID_H;
     text = "Show dead entities";
};
class view: side
{
     idc = IDC_LEFT_CAMMODE;
     y = safezoneH - 14 * GRID_H;
     h = 12 * GRID_H;
     columns=3;
     strings[]={"a3\3den\Data\Displays\Display3DEN\EntityMenu\movecamera_ca.paa","a3\ui_f\data\GUI\Rsc\RscDisplayEGSpectator\fps.paa","a3\ui_f\data\map\VehicleIcons\iconman_ca.paa"};
     onToolBoxSelChanged = "[['FREECAM','INTERNAL','EXTERNAL'] select (_this select 1)] call zade_spectator_fnc_switchCamMode;";
};
