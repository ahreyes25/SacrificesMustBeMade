var vxNew, vyNew;

cx += vx;
cy += vy;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

jumped = false;
landed = false;

if (vy < 1 && vy > -1)
    platform_check();
else
    repeat(abs(vy)) {
        if (!platform_check())
            y += sign(vy);
        else
            break;
    }

if (platformTarget) {
    if (!onGround)
        landed = true;
    
    if (landed)
        with (platformTarget) other.vy = 0;
    else
        with (platformTarget) other.vy = 0;
}

repeat(abs(vx)) {
    if (place_meeting(x + sign(vx), y, oSolid_par) && !place_meeting(x + sign(vx), y - 1, oSolid_par))
        y -= 1;
         
    if (place_meeting(x + sign(vx), y + 2, oSolid_par) && !place_meeting(x + sign(vx), y + 1, oSolid_par))
        y += 1;
        
    if (!place_meeting(x + sign(vx), y, oSolid_par))
        x += sign(vx);
    else
        vx = 0;
}

phy_position_x = x;
phy_position_y = y;	