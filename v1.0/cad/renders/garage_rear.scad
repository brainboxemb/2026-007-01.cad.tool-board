// Render entry point: current garage rear section

include <../config.scad>
include <../assemblies/garage_rear.scad>

$vpr = [68, 0, 135];
$vpt = [1900, -500, 1200];
$vpd = 5600;

garage_rear_scene(
    rear_wall_visible = true,
    left_wall_visible     = true,
    window_frame_visible  = true,
    door_frame_visible    = true,
    window_sill_visible   = true,
    workbench_visible     = true,
    floor_visible         = true,
    tool_backing_visible  = true,
    skadis_visible        = true,
    tool_mounts_visible   = true,
    skadis_slots_visible  = true,
    tool_panels_explode   = 0
);
