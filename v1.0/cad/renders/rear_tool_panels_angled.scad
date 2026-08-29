// Render entry point: angled inside view of the rear-wall tool-board layout

include <../config.scad>
include <../assemblies/garage_rear.scad>

// Natural standing-eye perspective from inside the garage.
// The view is almost horizontal, with only a slight downward angle.
// The yaw keeps enough perspective to read the depth of the room.
$vpr = [84, 0, 28];
$vpt = [1900, -500, 1450];
$vpd = 5600;

garage_rear_scene(
    rear_wall_visible = true,
    left_wall_visible = true,
    window_frame_visible = true,
    door_frame_visible = true,
    window_sill_visible = true,
    workbench_visible = true,
    floor_visible = true,
    tool_backing_visible = true,
    skadis_visible = true,
    tool_mounts_visible = false,
    skadis_slots_visible = true,
    skadis_mount_points_visible = true,
    skadis_mount_hardware_visible = false,
    reference_grid_visible = false,
    tool_panels_explode = 0
);
