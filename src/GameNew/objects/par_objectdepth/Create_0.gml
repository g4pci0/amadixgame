//event_inherited();

yorigin = 0;

spd = 0;
hsp = 0;
vsp = 0;
zsp = 0;
gravSpeed = 1;
jumpSpeed = 10;
zaxis = 0;
zfloor = 0;
zheight = 0;
shadowAlpha = 0.25;
shadowHeight = 12;
shadowOriginY = 0;
shadowOriginX = 0;
shadowSizeX = 0;
shadowSizeY = 0;
customSpr = false;
shadowStyle = spr_shadow_player;
shadowEnable = false;

canClickAt = false;
clickRadius = 4;
cursorSpr = cursorState.normal;

shadowSurface = -1;

anim_frame = 0;

finalangle = 0;
finalblend = c_white;
finalalpha = 1;

active = true;			//truly inactive outside of camera view - deactivated
//partActive = true;		//partially active outside of camera view - not deactivated
//nonCullable = false;	//cant deactivate outside of camera view
//partCullable = false;
cull = 2;
// 0 - non cullable
// 1 - part
// 2 - full

alarm[11] = 1;