
if ((hsp != 0) && (vsp != 0)){
	depth = -(bbox_bottom - (sprite_height - yorigin) + zaxis);
}


switch(type){
	case 0:
		
	break;
	case 1:
		rot += rotSpeed;
		
		x += lengthdir_x(spd, angle) + (-global.windDir * global.windStr/75);
		y += lengthdir_y(spd, angle) - (global.windStr/200);
		
		alpha -= fadeoutSpeed;
	break;
	case 2:
		curve_alpha_pos += fadeoutSpeed;
		x += (entity_sign * spd);
		accel += 0.02;
		y -= spd * accel;
		zaxis += 0.02;
		yscale = xscale;
		
		alpha -= fadeoutSpeed;
	break;
	case 3:
		x += lengthdir_x(spd, rot) + (-global.windDir * global.windStr/75);
		y += lengthdir_y(spd, rot);
	break;
	case 4:
		if (_anim_frame >= _anim_frames){
			_anim_frame = 0;	
		}
		if ((instance_exists(obj_gun_logic)) && (instance_exists(obj_amadix))){
			var heat_x = obj_amadix.x + lengthdir_x(13, obj_amadix.shootdir);
			var heat_y = obj_amadix.y + 16 + lengthdir_y(16, obj_amadix.shootdir);
			x = heat_x;
			y = heat_y;
			alpha = (obj_gun_logic.heat/4) - 0.75;	
		}
	break;
}





if (_anim){
	_anim_frame += _anim_speed;	
}

if (type != 4) || (type != 1){
	if (_anim_frame > _anim_frames){
		instance_destroy();
	}
}

if (alpha <= 0){
	instance_destroy();	
}