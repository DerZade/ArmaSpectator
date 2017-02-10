class zade_spectator_RscListNBox
{
	type = 102; // Type
	style = 0x00 + 0x10; // Style

     access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
     idc = -1; // Control identification (without it, the control won't be displayed)
     default = 0; // Control selected by default (only one within a display can be used)
     show = 1; // 1 (true) to show the control. Will be also shown when the attribute is missing.
     fade = 0; // Fade in range from 0 (fully visible) to 1 (hidden)
     blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.
     deletable = 0; // 1 if control can be deleted using ctrlDelete scripting command

     x = 0; // Horizontal coordinates
     y = 0; // Vertical coordinates
     w = 0; // Width
     h = 0; // Height

     tooltip = ""; // Tooltip text
     tooltipMaxWidth = 0.5; // Max width of a tooltip. When text is longer, it's broken into multiple lines
     tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
     tooltipColorText[] = {1,1,1,1}; // Tooltip text color
     tooltipColorBox[] = {0,0,0,0}; // Tooltip frame color


	font = "RobotoCondensedLight";
	SizeEx = 5 * GRID_H;
     shadow = 1;

	colorSelectBackground[] = {ACTIVECOLOR}; // Selected item fill color
	colorSelectBackground2[] = {ACTIVECOLOR}; // Selected item fill color (oscillates between this and colorSelectBackground)

	colorText[] = {1,1,1,1}; // Text and frame color
	colorDisabled[] = {1,1,1,0.25}; // Disabled text color
	colorSelect[] = {0,0,0,1}; // Text selection color
	colorSelect2[] = {0,0,0,1}; // Text selection color (oscillates between this and colorSelect)
	colorShadow[] = {0,0,0,0.5}; // Text shadow color (used only when shadow is 1)

	colorPicture[] = {1,1,1,1}; // Picture color
	colorPictureSelected[] = {1,1,1,1}; // Selected picture color
	colorPictureDisabled[] = {1,1,1,0.25}; // Disabled picture color

	columns[] = {0}; // Horizontal coordinates of columns (relative to list width, in range from 0 to 1)

	drawSideArrows = 0; // 1 to draw buttons linked by idcLeft and idcRight on both sides of selected line. They are resized to line height
	idcLeft = -1; // Left button IDC
	idcRight = -1; // Right button IDC

	period = 1; // Oscillation time between colorSelect/colorSelectBackground2 and colorSelect2/colorSelectBackground when selected
	disableOverflow = 0; // 0 to keep overflow as it was before, 1 to crop too long text

	rowHeight = 5.5 * GRID_H; // Row height
	maxHistoryDelay = 1; // Time since last keyboard type search to reset it

	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1}; // Sound played when an item is selected

	// Scrollbar configuration (applied only when LB_TEXTURES style is used)
     class ScrollBar
     {
          width = 0; // Width
          height = 0; // Height
          scrollSpeed = 0.06; // Scroll speed

          arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa"; // Arrow
          arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa"; // Arrow when clicked on
          border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa"; // Slider background (stretched vertically)
          thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa"; // Dragging element (stretched vertically)

          color[] = {1,1,1,1}; // Scrollbar color
     };
	class ListScrollBar: ScrollBar{};
};
