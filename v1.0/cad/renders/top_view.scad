// Render entry point: top view of the current layout

include <../config.scad>
include <../assemblies/garage_rear.scad>

$vpr = [0, 0, 0];
$vpt = [1900, -900, 0];
$vpd = 5600;

garage_rear_scene(
    rear_wall_visible = true,
    left_wall_visible     = true,
    window_frame_visible = true,
    door_frame_visible   = true,
    window_sill_visible  = true,
    workbench_visible    = true,
    floor_visible        = true
);
