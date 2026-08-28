// Export entry point: concrete rear wall only

include <../config.scad>
include <../project_components/rear_wall.scad>

rear_wall(
    width         = wall_width,
    height        = wall_height,
    thickness     = wall_thickness,
    window_x      = window_left_offset,
    window_z      = window_bottom,
    window_width  = window_width,
    window_height = window_height,
    door_x        = door_left,
    door_width    = door_width,
    door_height   = door_height
);
