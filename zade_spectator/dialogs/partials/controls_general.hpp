class titlebackground: zade_spectator_RscText
{
     x = 0;
     y = 0;
     w = (CONTROLS_W - 5.5) * GRID_W;
     h = 5.5 * GRID_H;
     colorBackground[] = {0,0,0,0.4};
};
class title: titlebackground
{
     text = "GENERAL CONTROLS";
     x = 5.5 * GRID_W;
     w = (CONTROLS_W - 11) * GRID_W;
     colorBackground[] = {0,0,0,0};
};
class general: zade_spectator_RscListNBox
{
     idc = IDC_CONTROLS_GENERAL_LIST;
     onLoad = "(_this select 0) ctrlEnable false;[_this select 0,'general'] call zade_spectator_fnc_onLoad_controlsList;";
     colorBackground[] = {0,0,0,0.2};
     x = 0;
     y = 5.5 * GRID_H;
     w = (CONTROLS_W - 5.5) * GRID_W;
     h = 5.5 * 20.5 * GRID_H;
     columns[]={0,0.5};
};
