/// @description on_ground

return (place_meeting(x, y + 1, oSolid_par)) || (place_meeting(x, y + 1, oPass_par) && !place_meeting(x, y, oPass_par));