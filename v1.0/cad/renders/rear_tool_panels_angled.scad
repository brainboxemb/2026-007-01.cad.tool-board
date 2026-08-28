// Render entry point: angled inside view of the rear-wall tool-board layout

include <../config.scad>
include <../assemblies/garage_rear.scad>

// Angled view from inside the garage towards the rear wall.
// Kept close enough to the straight elevation to make layout comparison easy.
$vpr = [72, 0, -24];
$vpt = [1900, -120, 1320];
$vpd = 6100;

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
    tool_panels_explode = 0
);
