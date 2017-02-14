class zade_spectator_TFAR
{
	idd = -1;
	duration = 2;
	fadein = 0.2;
	fadeout = 2;
	onLoad = "_this call zade_spectator_fnc_TFARonLoad";
	class ControlsBackground
	{
		class spectatorChannel : zade_spectator_RscPicture
		{
			idc = IDC_TFAR_SPEC;
			x = 0.45 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.05 * safezoneH;
			style = 2096;
			text = "a3\ui_f\data\GUI\Rsc\RscDisplayEGSpectator\fps.paa";
			colorText[]={1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class VoicesChannel : spectatorChannel
		{
			idc = IDC_TFAR_VOICE;
			x = 0.5 * safezoneW + safezoneX;
			text = "a3\ui_f\data\gui\cfg\CommunicationMenu\call_ca.paa";
			colorText[]={1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class Description : zade_spectator_RscText
		{
			idc = IDC_TFAR_DESC;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.02 * safezoneH;
			style = 2;
			text = "Spectator-Channel";
			colorText[]={1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
	};
	class controls {};
};
