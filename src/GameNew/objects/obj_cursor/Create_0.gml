global.cursorSpr = spr_cursor_default;
depth = DEPTH_CURSOR;

window_set_cursor(cr_none);

mouseInWindow = true;

enum cursorState{
	normal,
	pickup,
	dialogue,
	handgun,
	point
}

_x = 0;
_y = 0;

timer = 5;

global.cursorSpr = cursorState.normal;	