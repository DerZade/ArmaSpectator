#define GRID_W (pixelW * pixelGrid * 0.5)
#define GRID_H (pixelH * pixelGrid * 0.5)
#define LEFTPANEL_W 60
#define CONTROLS_W 120
#define CONTROLS_H 80
#define MAP_W 300
#define MAP_H 200
#define ACTIVECOLOR {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1}

// Base classes
#include "..\defines\RscButton.hpp"
#include "..\defines\RscCheckbox.hpp"
#include "..\defines\RscCombo.hpp"
#include "..\defines\RscControlsGroup.hpp"
#include "..\defines\RscEdit.hpp"
#include "..\defines\RscListNBox.hpp"
#include "..\defines\RscMap.hpp"
#include "..\defines\RscPicture.hpp"
#include "..\defines\RscStructuredText.hpp"
#include "..\defines\RscText.hpp"
#include "..\defines\RscToolbox.hpp"
#include "..\defines\RscTree.hpp"

// Dialogs
#include "..\dialogs\main.hpp"
