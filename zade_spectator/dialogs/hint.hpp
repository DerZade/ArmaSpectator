class zade_spectator_hint
{
	idd = -1;
	duration = 10;
	fadein = 0.2;
	fadeout = 2;
     onLoad = "uiNamespace setVariable ['zade_spectator_hint',_this select 0];";
	onUnLoad = "uiNamespace setVariable ['zade_spectator_hint',nil];";
	class ControlsBackground
	{
		class hint_text: zade_spectator_RscText
		{
               idc = 1;
               x = safezoneW / 2 - (MAP_W * 150) + safezoneX;
          	y = safezoneH - safezoneY;
          	w = MAP_W * 300;
          	h = 5.5 * GRID_H;
		};
	};
	class controls {};
};
