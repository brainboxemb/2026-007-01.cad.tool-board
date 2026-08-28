// Export entry point: complete current rear garage scene

include <../config.scad>
include <../assemblies/garage_rear.scad>

garage_rear_scene(
    rear_wall_visible = true,
    left_wall_visible     = true,
    window_frame_visible = true,
    door_frame_visible   = true,
    window_sill_visible  = true,
    workbench_visible    = true,
    floor_visible        = true
);
