//macros
#define GRID_W (pixelW * pixelGrid * 0.5)
#define GRID_H (pixelH * pixelGrid * 0.5)
#define LEFTPANEL_W 60
#define CONTROLS_W 120
#define CONTROLS_H 80
#define MAP_W 300
#define MAP_H 200
#define ACTIVECOLOR {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1}
#define ACTIVECOLOR_SCRIPT [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08]), 1]
#define QUOTE(var1) #var1
#define COMMA ,

//IDCs
#define IDC_LEFTPANEL 101
#define IDC_MAP 102
#define IDC_CONTROLS 103
#define IDC_FOCUSBUTTON 104
#define IDC_FAKEPANEL 105

#define IDC_CONTROLS_BACKGROUND 1030
#define IDC_CONTROLS_GENERAL_GRP 1031
#define IDC_CONTROLS_CAMERA_GRP 1032
#define IDC_CONTROLS_GENERAL_BTN 1033
#define IDC_CONTROLS_CAMERA_BTN 1034
#define IDC_CONTROLS_GENERAL_LIST 1035
#define IDC_CONTROLS_FREECAM_LIST 1036
#define IDC_CONTROLS_EXTERNAL_LIST 1037
#define IDC_CONTROLS_INTERNAL_LIST 1038
#define IDC_CONTROLS_TOOLBOX 1039

#define IDC_LEFT_SIDE 1011
#define IDC_LEFT_EDIT 1012
#define IDC_LEFT_SEARCH 1013
#define IDC_LEFT_TREE 1014
#define IDC_LEFT_RESULTS 1015
#define IDC_LEFT_CHECKBOX 1016
#define IDC_LEFT_CAMMODE 1017

#define IDC_MAP_MISSION 1021
#define IDC_MAP_MAP 1023

#define IDC_HINT_TEXT 101

#define IDC_TFAR_SPEC 101
#define IDC_TFAR_VOICE 102
#define IDC_TFAR_DESC 103
