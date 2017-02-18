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
		class getRestrictions {};
		class hint {};
		class isMedic {};
		class isUnconscious {};
		class onDraw3D {};
		class setRestrictions {};
		class splitString {};
		class switchCamMode {};
		class switchTarget {};
		class toggleTFAR {};
	};
	class ui
	{
		file = "zade_spectator\functions\ui";
		class collapseTree_onButtonClick {};
		class controlsList_onLoad {};
		class expandControls_onButtonClick {};
		class expandTree_onButtonClick {};
		class loadUnitsTree {};
		class main_onKeyDown {};
		class main_onKeyUp {};
		class main_onLoad {};
		class main_onMouseButtonDblClick {};
		class main_onMouseButtonDown {};
		class main_onMouseMoving {};
		class main_onMouseZChanged{};
		class map_onDraw {};
		class map_onMouseButtonClick {};
		class map_onMouseButtonDblClick {};
		class onTreeDblClick {};
		class panel_onMouseMoving {};
		class search_onButtonClick {};
		class search_onKeyUp {};
		class TFAR_onLoad {};
	};
};
