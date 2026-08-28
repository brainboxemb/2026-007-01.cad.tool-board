// Render entry point: inspect the generic 36 x 56 cm SKADIS component.

include <../config.scad>
include <../components/skadis_panel.scad>

$vpr = [90, 0, 0];
$vpt = [180, 0, 280];
$vpd = 1600;

skadis_panel(
    width = skadis_width,
    height = skadis_height,
    thickness = skadis_thickness,
    mount_gap = skadis_mount_gap,
    corner_radius = skadis_corner_radius,
    slot_width = skadis_slot_width,
    slot_height = skadis_slot_height,
    grid_pitch = skadis_grid_pitch,
    grid_offset = skadis_grid_offset,
    rail_length = skadis_rail_length,
    mount_point_z_inset = skadis_mount_point_z_inset,
    mount_head_diameter = skadis_mount_head_diameter,
    mount_head_depth = skadis_mount_head_depth,
    slot_pattern = true,
    mounting_points = true,
    mounting_hardware = true
);
