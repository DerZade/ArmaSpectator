class title: zade_spectator_RscText
{
	x = 0;
	y = 0;
	w = MAP_W * GRID_W;
	h = 5.5 * GRID_H;
	colorBackground[] = {0,0,0,0.5};
};
class missionName: zade_spectator_RscText
{
	idc = IDC_MAP_MISSION;
	x = 0;
	y = 0;
	text = "";
	w = (MAP_W / 2 - 25) * GRID_W;
	h = 5.5 * GRID_H;
};
class close: zade_spectator_RscButton
{
	onButtonClick = "(ctrlParentControlsGroup (_this select 0)) ctrlShow false;";
	style = 0x02 + 0x30 + 0x800;
	text = "\a3\3den\data\displays\display3den\search_end_ca.paa";
	x = (MAP_W - 5.5) * GRID_W;
	y = 0;
	w = 5.5 * GRID_W;
	h = 5.5 * GRID_H;
	colorBackground[] = {0,0,0,0};
	colorBackgroundActive[] = {0,0,0,0};
	colorFocused[] = {0,0,0,0};
};
class map: zade_spectator_RscMap
{
	idc = IDC_MAP_MAP;
	colorBackground[]={0.5,0.5,0.5,1};
	x = safezoneW / 2 - (MAP_W * GRID_W) / 2 + safezoneX;
	y = safezoneH / 2 - (MAP_H * GRID_H) / 2 + safezoneY + 5.5 * GRID_H;
	w = MAP_W * GRID_W;
	h = (MAP_H - 5.5) * GRID_H;
	onDraw = "_this call zade_spectator_fnc_onDraw2D;";
	onMouseButtonClick = "_this call zade_spectator_fnc_mapClick;";
};
