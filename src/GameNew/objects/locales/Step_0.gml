if (keyboard_check_pressed(ord("L"))){
	global.lang ++;
	if (global.lang > 1){
		global.lang = 0;	
	}
	
	language_update(global.lang);
}