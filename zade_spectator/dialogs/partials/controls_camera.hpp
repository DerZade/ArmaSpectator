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
     text = "CAMERA CONTROLS";
     x = 5.5 * GRID_W;
     w = (CONTROLS_W - 11) * GRID_W;
     colorBackground[] = {0,0,0,0};
};
class toolbox: zade_spectator_RscToolbox
{
     idc = IDC_CONTROLS_TOOLBOX;
     onSetFocus = QUOTE(_this spawn {sleep 0.1;ctrlSetFocus ((ctrlParent (_this select 0)) displayCtrl IDC_CONTROLS_CAMERA_BTN);};);
     sizeEx = 5 * GRID_H;
     colorBackground[]={0,0,0,0.4};
     colorSelectedBg[]={1,1,1,0.8};
     colorText[]={1,1,1,1};
     colorTextSelect[]={0,0,0,1};
     style = "0x02";
     x = 0;
     y = 5.5 * GRID_H;
     w = (CONTROLS_W - 5.5) * GRID_W;
     h = 5.5  * GRID_H;
     onToolBoxSelChanged = QUOTE(params ['_tb'];_disp = ctrlParent _tb; _cur = IDC_CONTROLS_FREECAM_LIST + (lbCurSel _tb);{(_disp displayCtrl _x) ctrlShow false;} forEach [IDC_CONTROLS_FREECAM_LIST COMMA IDC_CONTROLS_EXTERNAL_LIST COMMA IDC_CONTROLS_INTERNAL_LIST];(_disp displayCtrl _cur) ctrlShow true;);
     strings[]={"FREECAM","EXTERNAL","INTERNAL"};
     values[]={0,1,2,3};
     rows = 1;
     columns = 3;
};
class freecam: zade_spectator_RscListNBox
{
     idc = IDC_CONTROLS_FREECAM_LIST;
     onLoad = "[_this select 0,'camera_freecam'] call zade_spectator_fnc_controlsList_onLoad;";
     colorBackground[] = {0,0,0,0.2};
     x = 0;
     y = 11 * GRID_H;
     w = (CONTROLS_W - 5.5) * GRID_W;
     h = 5.5 * 8.5 * GRID_H;
     columns[]={0,0.5};
};
class external: freecam
{
     idc = IDC_CONTROLS_EXTERNAL_LIST;
     onLoad = "[_this select 0,'camera_external'] call zade_spectator_fnc_controlsList_onLoad;";
};
class internal: freecam
{
     idc = IDC_CONTROLS_INTERNAL_LIST;
     onLoad = "[_this select 0,'camera_internal'] call zade_spectator_fnc_controlsList_onLoad;";
};
