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
class expand_btn: zade_spectator_RscButton
{
     style = 0x02 + 0x30 + 0x800;
     onButtonClick = "hint str _this; _this call zade_spectator_fnc_btnClick_expandControls;";
	text = "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
	x = 0.5 * GRID_W;
	y = 0.5 * GRID_H;
	w = 4.5 * GRID_W;
	h = 4.5 * GRID_H;
	colorBackground[] = {0,0,0,0};
	colorBackgroundActive[] = {0,0,0,0};
	colorFocused[] = {0,0,0,0};
};

class list: zade_spectator_RscListNBox
{
     colorBackground[] = {0,0,0,0.4};
     x = 0;
     y = 5.5 * GRID_H;
     w = (CONTROLS_W - 5.5) * GRID_W;
     h = 5.5 * 8  * GRID_H;
     columns[]={0,0.5};
};
class remark: zade_spectator_RscText
{
     style = 2;
     text = "* You can change these in your ArmA Controls (Category: Camera)";
     x = 0;
     y = 5.5 * 9 * GRID_H;
     w = (CONTROLS_W - 5.5) * GRID_W;
     h = 5.5 * GRID_H;
};
