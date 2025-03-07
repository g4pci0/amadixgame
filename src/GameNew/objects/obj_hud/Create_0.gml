depth = DEPTH_UI + 1;

hp_x = 8;
hp_y = 55;

stamina_x = 8;
stamina_y = 87;

hpCoreColor = make_color_rgb(176, 35, 24);
staminaCoreColor = make_color_rgb(249, 243, 89);

clock_x = -8;
clock_y = -8;

clockArrow_x = clock_x + 32;
clockArrow_y = clock_y + 32;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

hud_slot_width = sprite_get_width(spr_hud_slot) * 6;
hud_slot_height = sprite_get_height(spr_hud_slot);

canOpenInv = true;

tabX[0] = 108;
tabY[0] = 12;
tabY_add[0] = 0;
tabY_hover[0] = false;
tabY_active[0] = true;

tabX[1] = 144;
tabY[1] = 12;
tabY_add[1] = 0;
tabY_hover[1] = false;
tabY_active[1] = false;

tabX[2] = 180;
tabY[2] = 12;
tabY_add[2] = 0;
tabY_hover[2] = false;
tabY_active[2] = false;

tabX[3] = 276;
tabY[3] = 12;
tabY_add[3] = 0;
tabY_hover[3] = false;
tabY_active[3] = false;

tabX[4] = 312;
tabY[4] = 12;
tabY_add[4] = 0;
tabY_hover[4] = false;
tabY_active[4] = false;

tabX[5] = 348;
tabY[5] = 12;
tabY_add[5] = 0;
tabY_hover[5] = false;
tabY_active[5] = false;


lasthud = hud.inv;

hud_slot_x = 108;
hud_slot_y = 12;

slots_x = hud_slot_x;
slots_y = hud_slot_y;
mouse_slotx = 0;
mouse_sloty = 0;

hud_slot_y_active[0] = 6;
hud_slot_y_active[1] = 0;
hud_slot_y_active[2] = 0;
hud_slot_y_active[3] = 0;
hud_slot_y_active[4] = 0;
hud_slot_y_active[5] = 0;

effect_x = 12;
effect_y = 148;

maxeffects = 16;
effect_grid = ds_grid_create(4, maxeffects);

enum hud{
	none = 0,
	slots = 1,
	inv = 2,
	player = 3,
	crafting = 4,
	map = 5,
	journal = 6,
	options = 7,
}

show_hud = hud.slots;
hud_inner = false;

selected_hud_slot = 0;

t = 0;

clockFont = font_add_sprite_ext(spr_hud_clock_font, "1234567890DN", true, 2);

clockNumX = [];
clockNumY = [];
clockNumDist = 10;
nght = "";

var i = 1;

repeat(12){
	
	clockNumX[i - 1] = lengthdir_x(clockNumDist, 60 - ((i - 1) * 30));
	clockNumY[i - 1] = lengthdir_y(clockNumDist, 60 - ((i - 1) * 30));
	
	i++;
}
