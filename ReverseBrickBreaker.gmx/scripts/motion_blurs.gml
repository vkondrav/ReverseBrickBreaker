pdis = point_distance(x,y,xprevious,yprevious)*3;
pdir = point_direction(x,y,xprevious,yprevious);

for(i=pdis;i>0;i-=1) {
    ldx = x+lengthdir_x(i,pdir);
    ldy = y+lengthdir_y(i,pdir);
    
    draw_sprite_ext(sprite_index,
                    image_index,
                    ldx,
                    ldy,
                    image_xscale,
                    image_yscale,
                    image_angle,
                    image_blend,
                    (pdis/150)-(i/100));
}

draw_sprite_ext(sprite_index,
                image_index,
                x,
                y,
                image_xscale,
                image_yscale,
                image_angle,
                image_blend,
                image_alpha-(pdis/100));
