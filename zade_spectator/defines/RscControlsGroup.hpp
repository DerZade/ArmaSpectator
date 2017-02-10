class zade_spectator_RscControlsGroup
{
	type = 15;
	idc = -1;
	style = 0;
	x = 0;     y = 0; w = 1; h = 1;
	shadow=0;
	class ScrollBar
	{
		color[] = {1,1,1,0};
		colorActive[] = {1,1,1,0};
		colorDisabled[] = {1,1,1,0};
		thumb = "#(argb,8,8,3)color(1,1,1,0)";
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,0)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,0)";
		border = "#(argb,8,8,3)color(1,1,1,0)";
	};
	class VScrollbar: ScrollBar
	{
		width = 0;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		shadow=0;
	};
	class HScrollbar: ScrollBar
	{
		height = 0;
		shadow = 0;
	};

	class Controls{};// an empty class telling the engine, no custom, additional controls
};
