// Export entry point: generic SKADIS 36 x 56 cm board geometry.

include <../config.scad>
include <../components/skadis_panel.scad>

skadis_board(
    width = skadis_width,
    height = skadis_height,
    thickness = skadis_thickness,
    corner_radius = skadis_corner_radius,
    slot_width = skadis_slot_width,
    slot_height = skadis_slot_height,
    grid_pitch = skadis_grid_pitch,
    grid_offset = skadis_grid_offset,
    slots = true
);
