// Render entry point: rear wall elevation without workbench/floor

include <../config.scad>
include <../assemblies/garage_rear.scad>

$vpr = [90, 0, 180];
$vpt = [1900, 0, 1300];
$vpd = 4700;

garage_rear_scene(
    rear_wall_visible = true,
    left_wall_visible     = false,
    window_frame_visible = true,
    door_frame_visible   = true,
    window_sill_visible  = true,
    workbench_visible    = false,
    floor_visible        = false
);
