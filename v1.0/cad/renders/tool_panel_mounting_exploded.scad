// Render entry point: inspect routed recesses and concealed Ropro mount

include <../config.scad>
include <../assemblies/garage_rear.scad>

$vpr = [72, 0, 150];
$vpt = [1050, -80, 1750];
$vpd = 3600;

garage_rear_scene(
    rear_wall_visible = true,
    left_wall_visible     = true,
    window_frame_visible  = false,
    door_frame_visible    = false,
    window_sill_visible   = false,
    workbench_visible     = false,
    floor_visible         = false,
    tool_backing_visible  = true,
    skadis_visible        = false,
    tool_mounts_visible   = true,
    skadis_slots_visible  = false,
    tool_panels_explode   = 120
);
