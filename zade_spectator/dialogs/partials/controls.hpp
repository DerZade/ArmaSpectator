class title: zade_spectator_RscText
{
	text = "CONTROLS";
	x = 0;
	y = 0;
	w = CONTROLS_W * GRID_W;
	h = 5.5 * GRID_H;
	colorBackground[] = ACTIVECOLOR;
};
class close: zade_spectator_RscButton
{
	style = 0x02 + 0x30 + 0x800;
	onButtonClick = "(ctrlParentControlsGroup (_this select 0)) ctrlShow false;";
	text = "\a3\3den\data\displays\display3den\search_end_ca.paa";
	x = (CONTROLS_W - 5.5) * GRID_W;
	y = 0;
	w = 5.5 * GRID_W;
	h = 5.5 * GRID_H;
	colorBackground[] = {0,0,0,0};
	colorBackgroundActive[] = {0,0,0,0};
	colorFocused[] = {0,0,0,0};
};
class content: zade_spectator_RscControlsGroup
{
	x = 0;
	y = 6.05 * GRID_H;
	w = CONTROLS_W * GRID_W;
	h = (CONTROLS_H - 6.05) * GRID_H;
	colorBackground[] = {0,0,0,0.5};
	class controls
	{
		class background : zade_spectator_RscText
		{
			idc = IDC_CONTROLS_BACKGROUND;
			x = 0;
			y = 0;
			w = CONTROLS_W * GRID_W;
			h = (CONTROLS_H - 6.05) * GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};
		class remark: zade_spectator_RscText
		{
		     style = 2;
		     text = "* You can change these in your ArmA Controls (Category: Camera)";
			x = 2.75 * GRID_W;
			y = 2.75 * GRID_H;
		     w = (CONTROLS_W - 5.5) * GRID_W;
		     h = 5.5 * GRID_H;
		};
		class general: zade_spectator_RscControlsGroup
		{
			idc = IDC_CONTROLS_GENERAL_GRP;
			x = 2.75 * GRID_W;
			y = 11 * GRID_H;
			w = (CONTROLS_W - 5.5) * GRID_W;
			h = 5.5 * GRID_H;
			onLoad = "(_this select 0) ctrlEnable false;";
			colorBackground[] = {-1,-1,-1,1};
			class controls
			{
				#include "controls_general.hpp"
			};
		};
		class camera: general
		{
			idc = IDC_CONTROLS_CAMERA_GRP;
			y = 19.25 * GRID_H;
			colorBackground[] = {-1,-1,-1,1};
			onLoad = "";
			class controls
			{
				#include "controls_camera.hpp"
			};
		};
		class general_expand_btn: zade_spectator_RscButton
		{
		     idc = IDC_CONTROLS_GENERAL_BTN;
		     style = 0x02 + 0x30 + 0x800;
		     onButtonClick = "_this call zade_spectator_fnc_btnClick_expandControls;";
			text = "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
			x = 3.25 * GRID_W;
			y = 11.5 * GRID_H;
			w = 4.5 * GRID_W;
			h = 4.5 * GRID_H;
			colorText[]={1,1,1,1};
			colorBackground[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
		class camera_expand_btn: general_expand_btn
		{
		     idc = IDC_CONTROLS_CAMERA_BTN;
			y = 19.75 * GRID_H;
		};
	};
};
