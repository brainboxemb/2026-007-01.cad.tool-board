// Render entry point: rear wall with multiplex/SKADIS tool panels

include <../config.scad>
include <../assemblies/garage_rear.scad>

// Straight inside elevation, looking towards the rear wall.
$vpr = [90, 0, 0];
$vpt = [1900, 0, 1300];
$vpd = 6500;

garage_rear_scene(
    rear_wall_visible = true,
    left_wall_visible     = true,
    window_frame_visible  = true,
    door_frame_visible    = true,
    window_sill_visible   = true,
    workbench_visible     = true,
    floor_visible         = false,
    tool_backing_visible  = true,
    skadis_visible        = true,
    tool_mounts_visible   = false,
    skadis_slots_visible  = true,
    skadis_mount_points_visible = true,
    skadis_mount_hardware_visible = false,
    tool_panels_explode   = 0
);
