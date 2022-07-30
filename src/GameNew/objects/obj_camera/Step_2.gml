
camera_set_view_size(view_camera[0], view_width, view_height);

switch (mode) {
    case camera_mode.follow_player:
	
	if (global.inCutscene){
		following = obj_amadix_cutscene;
	}else{
		following = obj_amadix;	
	}
	        if (instance_exists(following)){
				
				if (!stop){
				
					bounded = true;
				
					var cam_x = clamp((following.x-(view_width/2)),0 , room_width-(view_width));
					var cam_y = clamp((following.y-(view_height/2) + _y),0, room_height-(view_height));
				
					var cam_x_pos = camera_get_view_x(view_camera[0]);
					var cam_y_pos = camera_get_view_y(view_camera[0]);
				
					var cam_speed = 0.2;

					camera_set_view_pos(view_camera[0],
									    (round_to4(lerp(cam_x_pos,cam_x,cam_speed))),
										(round_to4(lerp(cam_y_pos,cam_y,cam_speed))));	
									
				}
			}
			
    break;


    case camera_mode.follow_player_precise:
	
	following = obj_amadix;
	        if (instance_exists(following)){
				
				bounded = true;
				
				var cam_x = clamp((following.x-(view_width/2)),0 , room_width-(view_width));
				var cam_y = clamp((following.y-(view_height/2) + _y),0, room_height-(view_height));

				camera_set_view_pos(view_camera[0], (cam_x), (cam_y));
									
			}
			
    break;
}

if (!bounded){
	camera_set_view_pos(view_camera[0], 0, 0);
}