// Render entry point: angled inside view of the rear-wall tool-board layout

include <../config.scad>
include <../assemblies/garage_rear.scad>

// Camera is deliberately placed on the GARAGE side of the rear wall.
// This gives a natural workshop view towards the rear wall, with some
// floor and left wall visible, rather than looking through the rear wall.
$vpr = [68, 0, 28];
$vpt = [1900, -450, 1300];
$vpd = 5900;

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
