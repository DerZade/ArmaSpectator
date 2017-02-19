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
#define IDC_LEFTPANEL 1
#define IDC_MAP 2
#define IDC_CONTROLS 3
#define IDC_FOCUSBUTTON 4
#define IDC_FAKEPANEL 5

#define IDC_CONTROLS_BACKGROUND 30
#define IDC_CONTROLS_GENERAL_GRP 31
#define IDC_CONTROLS_CAMERA_GRP 32
#define IDC_CONTROLS_GENERAL_BTN 33
#define IDC_CONTROLS_CAMERA_BTN 34
#define IDC_CONTROLS_GENERAL_LIST 35
#define IDC_CONTROLS_FREECAM_LIST 36
#define IDC_CONTROLS_EXTERNAL_LIST 37
#define IDC_CONTROLS_INTERNAL_LIST 38
#define IDC_CONTROLS_TOOLBOX 39

#define IDC_LEFT_SIDE 11
#define IDC_LEFT_EDIT 12
#define IDC_LEFT_SEARCH 13
#define IDC_LEFT_TREE 14
#define IDC_LEFT_RESULTS 15
#define IDC_LEFT_CHECKBOX 16
#define IDC_LEFT_CAMMODE 17

#define IDC_MAP_MISSION 21
#define IDC_MAP_MAP 23

#define IDC_HINT_TEXT 1

#define IDC_TFAR_SPEC 1
#define IDC_TFAR_VOICE 2
#define IDC_TFAR_DESC 3
