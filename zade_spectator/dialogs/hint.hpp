class zade_spectator_hint
{
	idd = -1;
	duration = 4;
	fadein = 0.2;
	fadeout = 2;
     onLoad = "uiNamespace setVariable ['zade_spectator_hint',_this select 0];";
	onUnLoad = "uiNamespace setVariable ['zade_spectator_hint',nil];";
	class ControlsBackground
	{
		class hint_text: zade_spectator_RscText
		{
               idc = IDC_HINT_TEXT;
               x = safezoneW / 2 - (MAP_W *GRID_W  /2) + safezoneX;
          	y = safezoneY + 5.5 * GRID_H;
          	w = MAP_W * GRID_W;
          	h = 11 * GRID_H;
			style = 530;
		};
	};
	class controls {};
};
