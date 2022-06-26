depth = -1;

//Rysuj menu ekwipunku
if (obj_inventory.show_inventory) && (!obj_inventory.show_slots){
	draw_set_alpha(0.5);
	draw_rectangle_color(-8, -8, obj_display.ideal_width + 8, obj_display.ideal_height + 8, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_sprite_ext(obj_inventory.spr_eq_back, 1, obj_inventory.backUI_x, obj_inventory.backUI_y, obj_inventory.scale, obj_inventory.scale, 0, c_white, 1);


}
/*
//Rysuj maks rdzen zdrowia
draw_circle_segment(hp_x + 16, hp_y + 16, global.maxhp, global.maxhp, hpCoreColor, 18, 0.5);

//Rysuj rdzen zdrowia
draw_circle_segment(hp_x + 16, hp_y + 16, global.hp, global.maxhp, hpCoreColor, 18, 1);


//Rysuj GUI zdrowia
draw_sprite_ext(spr_health_hud_2, 0, hp_x + 16, hp_y + 16, .25, .25, 0, c_white, 1);

draw_sprite_ext(spr_health_hud_2, 1, hp_x + 16, hp_y + 16, .25, .25, 0, c_white, 1);

//Rysuj maks rdzen energii
draw_circle_segment(stamina_x + 16, stamina_y + 16, global.maxstamina, global.maxstamina, staminaCoreColor, 18, 0.5);

//Rysuj rdzen energii
draw_circle_segment(stamina_x + 16, stamina_y + 16, global.stamina, global.maxstamina, staminaCoreColor, 18, 1);


//Rysuj GUI energii
draw_sprite_ext(spr_health_hud_2, 0, stamina_x + 16, stamina_y + 16, .25, .25, 0, c_white, 1);

draw_sprite_ext(spr_health_hud_2, 2, stamina_x + 16, stamina_y + 16, .25, .25, 0, c_white, 1);
*/

//-----------------------------------------------
// Health back

draw_sprite(spr_hud_stats, 1, hp_x, hp_y);

// Health main

var hp_y_real = 6 + 20 - ((global.hp / global.maxhp) * 20);
draw_sprite_part(spr_hud_stats, 2, 0, hp_y_real, 32, 26, hp_x, hp_y + hp_y_real);

// Health frame

draw_sprite(spr_hud_stats, 0, hp_x, hp_y);

//-----------------------------------------------

//-----------------------------------------------
// Stamina back

draw_sprite(spr_hud_stats, 4, stamina_x, stamina_y);

// Stamina main

var stamina_y_real = 3 + 20 - ((global.stamina / global.maxstamina) * 22);
draw_sprite_part(spr_hud_stats, 5, 0, stamina_y_real, 32, 25, stamina_x, stamina_y + stamina_y_real);

// Stamina frame

draw_sprite(spr_hud_stats, 3, stamina_x, stamina_y);

//-----------------------------------------------


//Rysuj efekty
var i = 0;
repeat(maxeffects){
	ds_grid_sort(effect_grid, 0, false);
	var ef = -1;
	var amp = 0;
	if (effect_grid[# EF_AMPLIFIER, i] == 1){amp = c_green;}
	if (effect_grid[# EF_AMPLIFIER, i] == 2){amp = c_yellow;}
	if (effect_grid[# EF_AMPLIFIER, i] == 3){amp = c_red;}
	switch(effect_grid[# EF_EFFECT, i]){
		case effect.speed_ef: ef = 0; break;
		case effect.stuffed: ef = 1; break;
		case effect.regeneration: ef = 2; break;
	}
	
	if (effect_grid[# EF_DURATION, i] - effect_grid[# EF_TIMER, i]){
		draw_sprite_ext(spr_health_hud_2, 0, effect_x, effect_y + (16 * i), .11, .11, 0, c_white, .5);
		draw_circle_segment(effect_x, effect_y + (16 * i), effect_grid[# EF_DURATION, i] - effect_grid[# EF_TIMER, i], effect_grid[# EF_DURATION, i], amp, 7.5, .5);
		draw_sprite_ext(spr_inventory_item_effects, ef, effect_x, effect_y + (16 * i), .5, .5, 0, c_white, 1);
	}
	i++;
}
////////////////////////


if (show_hud == hud.inv) || (show_hud == hud.crafting) || (show_hud == hud.player) || (show_hud == hud.map) || (show_hud == hud.journal) || (show_hud == hud.options){
	draw_sprite(spr_eq_menu, 0, hud_slot_x, hud_slot_y + hud_slot_y_active[0]);
	draw_sprite(spr_eq_menu, 1, hud_slot_x + 24 + 12, hud_slot_y + hud_slot_y_active[1]);
}

if (obj_inventory.show_inventory) && (!obj_inventory.show_slots){
	draw_sprite_ext(obj_inventory.spr_eq_back, 0, obj_inventory.backUI_x, obj_inventory.backUI_y, obj_inventory.scale, obj_inventory.scale, 0, c_white, 1);
	draw_sprite_ext(obj_inventory.spr_eq_back, 2, obj_inventory.backUI_x, obj_inventory.backUI_y, obj_inventory.scale, obj_inventory.scale, 0, c_white, 1);
}
////////////////////////


// Rysuj zegar

if instance_exists(obj_daynightclock){
	var arrow_angle = -obj_daynightclock.rot*2;
}else{
	var arrow_angle = 0;	
}

// Zegar
draw_sprite_ext(spr_hud_clock, 0, clock_x, clock_y, 1, 1, 0, c_white, 1);

// Wskazowka
draw_sprite_ext(spr_hud_clock_arrow, 0, clockArrow_x, clockArrow_y, .5, .5, arrow_angle, c_white, 1);

// Liczby
var i = 1;
var size = .25;

repeat(12){
	
	if ((i) mod 3 == 0){
		size = .25;	
	}else{
		size = .1875;	
	}
	
	draw_set_font(clockFont);
	draw_set_color(#202027);
	draw_set_alpha(1);
	draw_text_transformed(clockArrow_x + clockNumX[i - 1] + .5, clockArrow_y + clockNumY[i - 1], string(i), size, size, 0);
	draw_set_font(font_item);
	
	
	i++;
}

//