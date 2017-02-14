class title: zade_spectator_RscText
{
	text = "CONTROLS";
	x = 0;
	y = 0;
	w = CONTROLS_W * GRID_W;
	h = 5.5 * GRID_H;
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
};
class close: zade_spectator_RscButton
{
	style = 0x02 + 0x30 + 0x800;
	onButtonClick = "((ctrlParent (_this select 0)) displayCtrl 3) ctrlShow false;";
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
			idc = 1337;
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
			idc = 31;
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
			idc = 32;
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
		     idc = 33;
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
		     idc = 34;
			y = 19.75 * GRID_H;
		};
	};
};
