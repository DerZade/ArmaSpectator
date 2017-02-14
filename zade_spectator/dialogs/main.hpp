class zade_spectator_main
{
	idd = -1;
	movingEnable = false;
	onLoad = "_this call zade_spectator_fnc_onLoad_main";
	onUnLoad = "uiNamespace setVariable ['zade_spectator_main',nil];";
	onKeyDown = "_this call zade_spectator_fnc_onKeyDown;";
	onKeyUp = "_this call zade_spectator_fnc_onKeyUp;";
	class ControlsBackground
	{
		class mouseHandler: zade_spectator_RscStructuredText
		{
			text="";
			x="safeZoneXAbs";
			y="safeZoneY";
			w="safeZoneWAbs";
			h="safeZoneH";
			colorBackground[]={1,1,1,0};
			style=16;
			onMouseButtonDown = "_this call zade_spectator_fnc_onMouseButtonDown;";
			onMouseButtonDblClick = "_this call zade_spectator_fnc_onMouseButtonDblClick;";
			onMouseZChanged = "_this call zade_spectator_fnc_onMouseZChanged;";
		};
	};
	class Controls {
		class LeftPanel: zade_spectator_RscControlsGroup
		{
			idc = IDC_LEFTPANEL;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = LEFTPANEL_W * GRID_W;
			h = 1 * safezoneH;
			onMouseMoving = "_this call zade_spectator_fnc_panel_onMouseMoving;";
			class Controls
			{
				#include "partials\LeftPanel.hpp"
			};
		};
		class map: zade_spectator_RscControlsGroup
		{
			idc = IDC_MAP;
			show = 0;
			x = safezoneW / 2 - (MAP_W * GRID_W) / 2 + safezoneX;
			y = safezoneH / 2 - (MAP_H * GRID_H) / 2 + safezoneY;
			w = MAP_W * GRID_W;
			h = MAP_H * GRID_H;
			colorBackground[]={0,0,0,1};
			class Controls
			{
				#include "partials\map.hpp"
			};
		};
		class Controls: zade_spectator_RscControlsGroup
		{
			idc = IDC_CONTROLS;
			show = 0;
			x = safezoneW / 2 - (CONTROLS_W * GRID_W) / 2 + safezoneX;
			y = safezoneH / 2 - (CONTROLS_H * GRID_H) / 2 + safezoneY;
			w = CONTROLS_W * GRID_W;
			h = CONTROLS_H * GRID_H;
			class Controls
			{
				#include "partials\controls.hpp"
			};
		};
		class FocusButton : zade_spectator_RscButton {
			idc = IDC_FOCUSBUTTON;
			text = "";
			x = -0.1 * safezoneW + safezoneX;
			y = -0.1 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class FakePanel : zade_spectator_RscStructuredText
		{
			idc = IDC_FAKEPANEL;
			show = 0;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = LEFTPANEL_W * GRID_W;
			h = 1 * safezoneH;
			onMouseMoving = "_this call zade_spectator_fnc_panel_onMouseMoving;";
		};
	};
};
