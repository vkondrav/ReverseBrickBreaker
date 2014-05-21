/*
  -* QUICK AND EASY MOTION BLUR SCRIPT *-
         By GMFreak ( Dale Moore )
  
  Please give credit if used!
*/

__0__pdis = point_distance(x,y,xprevious,yprevious);
__0__pdir = point_direction(x,y,xprevious,yprevious);
for(i=__0__pdis;i>0;i-=1) {
    __0__ldx = x+lengthdir_x(i,__0__pdir);
    __0__ldy = y+lengthdir_y(i,__0__pdir);
    
    draw_sprite_ext(sprite_index,image_index,__0__ldx,__0__ldy,image_xscale,image_yscale,image_angle,image_blend,(__0__pdis/150)-(i/100));
}

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha-(__0__pdis/100));
