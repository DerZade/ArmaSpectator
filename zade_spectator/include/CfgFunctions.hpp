//include this file in the CfgFunctions class in your description.ext
//   #include "zade_spectator\include\CfgFunctions.hpp"

class zade_spectator {
	class misc
	{
		file = "zade_spectator\functions\misc";
		class addCustomMarker {};
		class addSpectateable {};
		class allUnits {};
		class camera {};
		class deadside {};
		class EH_GetInMan {};
		class EH_GetOutMan {};
		class EH_Killed {};
		class enter {};
		class exit {};
		class findInPairs {};
		class isMedic {};
		class isUnconscious {};
		class onDraw3D {};
		class splitString {};
		class switchCamMode {};
		class switchTarget {};
		class toggleTFAR {};
	};
	class ui
	{
		file = "zade_spectator\functions\ui";
		class btnClick_collapse {};
		class btnClick_expand {};
		class btnclick_expandControls {};
		class btnClick_search {};
		class hint {};
		class keyUp_search {};
		class loadUnitsTree {};
		class mapClick {};
		class onDraw2D {};
		class onKeyDown {};
		class onKeyUp {};
		class onLoad_controlsList {};
		class onLoad_main {};
		class onMouseButtonDblClick {};
		class onMouseButtonDown {};
		class onMouseMoving {};
		class onMouseZChanged{};
		class onTreeDblClick {};
		class panel_onMouseMoving {};
		class TFARonLoad {};
	};
};
