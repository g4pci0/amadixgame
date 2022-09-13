event_inherited();

if (playerVisible){
	scr_draw_player(round_to4(x), round_to4(y), round_to4(zaxis));
	
	if (state == player_state.wading) || (state == player_state.wading_idle){
		draw_sprite_ext(spr_entity_water_shallow, (obj_gamecontrol.refTimer * 4), x, y + sprite_height, 1, 1, 0, c_white, .9);
		draw_sprite_ext(spr_entity_wateredge, 0, x, y + sprite_height, 1, 1, 0, c_white, 1);
	}
	
	if (state == player_state.swimming) || (state == player_state.swimming_idle){
		draw_sprite_ext(spr_entity_water, (obj_gamecontrol.refTimer * 4), x, y + sprite_height, 1, 1, 0, c_white, .9);
		draw_sprite_ext(spr_entity_wateredge, 1, x, y + sprite_height, 1, 1, 0, c_white, 1);
	}
	
}
draw_text(x, y, facing);
draw_text(x, y+8, shootdir);
draw_text(x, y+16, hand_rot);
//draw_text(x + 32, y, zaxis);
//draw_text(x + 32, y + 8, zfloor);
//draw_text(x + 32, y + 16, zheight);

//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);

//draw_sprite(head_index, 0, x + 32, y - 32);

//draw_sprite(torso_index, 0, x + 32, y - 16);

//draw_sprite(hands_index, 0, x + 32, y);

//draw_sprite(legs_index, 0, x + 32, y + 16);

//draw_sprite(arms_index, 0, x + 32, y + 32);

//draw_sprite(arms2_index, 0, x + 32, y + 48);



//draw_text(x + 32, y, hsp);
//draw_text(x + 32, y + 8, vsp);

//draw_text(x + 32, y + 24, running);
//draw_text(x + 32, y + 32, spd);
//draw_text(x + 32, y + 46, skid);
//draw_text(x + 32, y + 64, skidTimer);

//draw_text(x - 32, y + 48, depth);
//draw_text(x + 32, y + 48, zfloor);