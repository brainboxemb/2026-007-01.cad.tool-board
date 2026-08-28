//
// Project component: rear-wall multiplex + SKADIS tool panels.
//
// Garage interior is on negative Y. The multiplex is positioned against the
// inside face of the concrete wall. A routed recess provides clearance for
// the Ropro Z-bar system, allowing the panel to sit essentially flush with
// the concrete in the model.
//

include <../components/backing_panel.scad>
include <../components/skadis_panel.scad>
include <../components/french_cleat_zbar.scad>

module rear_tool_panel(
    x,
    z,
    width,
    height,
    backing_thickness,
    cleat_wall_length,
    cleat_panel_lengths,
    cleat_height = 38,
    cleat_recess_depth = 6,
    cleat_recess_clearance = 1,
    cleat_top_inset = 50,
    skadis_columns = 1,
    skadis_rows = 2,
    skadis_width = 360,
    skadis_height = 560,
    skadis_thickness = 5,
    skadis_mount_gap = 15,
    skadis_corner_radius = 9,
    skadis_slot_width = 5,
    skadis_slot_height = 15,
    skadis_grid_pitch = 40,
    skadis_grid_offset = 20,
    skadis_rail_length = 200,
    skadis_mount_point_z_inset = 20,
    skadis_mount_head_diameter = 12,
    skadis_mount_head_depth = 2,
    skadis_slot_pattern = true,
    skadis_mount_points = true,
    skadis_mount_hardware = false,
    panel_visible = true,
    skadis_visible = true,
    mounting_visible = true,
    explode = 0
) {
    // The recess clears the complete wall rail, not only the counter-profile
    // attached to the multiplex. This is required if the 6 mm stand-off is
    // to be absorbed by routing the back of the panel.
    recess_width = cleat_wall_length + 2 * cleat_recess_clearance;
    recess_height = cleat_height + 2 * cleat_recess_clearance;

    recess_x = (width - recess_width) / 2;
    cleat_x = (width - cleat_wall_length) / 2;
    cleat_z = height - cleat_top_inset - cleat_height;
    recess_z = cleat_z - cleat_recess_clearance;

    panel_y = -explode;

    // Multiplex backing panel.
    if (panel_visible)
        color([0.72, 0.55, 0.34])
            translate([x, panel_y, z])
                backing_panel(
                    width = width,
                    height = height,
                    thickness = backing_thickness,
                    recesses = [[
                        recess_x,
                        recess_z,
                        recess_width,
                        recess_height,
                        cleat_recess_depth
                    ]]
                );

    // Simplified wall-side long rail. In the assembled model this is hidden
    // inside the routed recess. When explode > 0 the relation becomes visible.
    if (mounting_visible)
        color([0.70, 0.72, 0.74])
            translate([
                x + cleat_x,
                -cleat_recess_depth,
                z + cleat_z
            ])
                french_cleat_zbar_envelope(
                    length = cleat_wall_length,
                    height = cleat_height,
                    depth = cleat_recess_depth
                );

    // Panel-side counter profiles. For the 60+6 cm set this is two 60 mm
    // pieces; for the 30 cm set it is one full 300 mm counter profile.
    if (mounting_visible) {
        if (len(cleat_panel_lengths) == 1) {
            piece_length = cleat_panel_lengths[0];
            piece_x = (width - piece_length) / 2;

            color([0.46, 0.48, 0.50])
                translate([
                    x + piece_x,
                    panel_y - cleat_recess_depth,
                    z + cleat_z
                ])
                    french_cleat_zbar_envelope(
                        length = piece_length,
                        height = cleat_height,
                        depth = cleat_recess_depth
                    );
        } else {
            left_piece = cleat_panel_lengths[0];
            right_piece = cleat_panel_lengths[1];
            rail_left = cleat_x;
            rail_right = cleat_x + cleat_wall_length;

            color([0.46, 0.48, 0.50]) {
                translate([
                    x + rail_left,
                    panel_y - cleat_recess_depth,
                    z + cleat_z
                ])
                    french_cleat_zbar_envelope(
                        length = left_piece,
                        height = cleat_height,
                        depth = cleat_recess_depth
                    );

                translate([
                    x + rail_right - right_piece,
                    panel_y - cleat_recess_depth,
                    z + cleat_z
                ])
                    french_cleat_zbar_envelope(
                        length = right_piece,
                        height = cleat_height,
                        depth = cleat_recess_depth
                    );
            }
        }
    }

    // The 1220 mm backing leaves 50 mm above and below two 560 mm panels.
    // Horizontally the complete SKADIS grid is centred. The left panel gets
    // 50 mm wood on either side; the two right boards use the full 720 mm.
    skadis_total_width = skadis_columns * skadis_width;
    skadis_total_height = skadis_rows * skadis_height;
    skadis_x0 = (width - skadis_total_width) / 2;
    skadis_z0 = (height - skadis_total_height) / 2;

    if (skadis_visible)
        for (col = [0 : skadis_columns - 1])
            for (row = [0 : skadis_rows - 1])
                translate([
                    x + skadis_x0 + col * skadis_width,
                    panel_y - backing_thickness,
                    z + skadis_z0 + row * skadis_height
                ])
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
                        slot_pattern = skadis_slot_pattern,
                        mounting_points = skadis_mount_points,
                        mounting_hardware = skadis_mount_hardware
                    );
}

module rear_tool_panels(
    backing_visible = true,
    skadis_visible = true,
    mounting_visible = true,
    slot_pattern = true,
    skadis_mount_points_visible = true,
    skadis_mount_hardware_visible = false,
    explode = 0
) {
    // Left: 460 x 1220 mm multiplex, 1 x 2 SKADIS, Ropro 30 cm set.
    rear_tool_panel(
        x = left_tool_panel_x,
        z = tool_panel_bottom,
        width = left_tool_panel_width,
        height = tool_panel_height,
        backing_thickness = tool_panel_thickness,
        cleat_wall_length = left_cleat_wall_length,
        cleat_panel_lengths = [left_cleat_panel_length],
        cleat_height = cleat_profile_height,
        cleat_recess_depth = cleat_recess_depth,
        cleat_recess_clearance = cleat_recess_clearance,
        cleat_top_inset = cleat_top_inset,
        skadis_columns = 1,
        skadis_rows = 2,
        skadis_width = skadis_width,
        skadis_height = skadis_height,
        skadis_thickness = skadis_thickness,
        skadis_mount_gap = skadis_mount_gap,
        skadis_corner_radius = skadis_corner_radius,
        skadis_slot_width = skadis_slot_width,
        skadis_slot_height = skadis_slot_height,
        skadis_grid_pitch = skadis_grid_pitch,
        skadis_grid_offset = skadis_grid_offset,
        skadis_rail_length = skadis_rail_length,
        skadis_mount_point_z_inset = skadis_mount_point_z_inset,
        skadis_mount_head_diameter = skadis_mount_head_diameter,
        skadis_mount_head_depth = skadis_mount_head_depth,
        skadis_slot_pattern = slot_pattern,
        skadis_mount_points = skadis_mount_points_visible,
        skadis_mount_hardware = skadis_mount_hardware_visible,
        panel_visible = backing_visible,
        skadis_visible = skadis_visible,
        mounting_visible = mounting_visible,
        explode = explode
    );

    // Right: 720 x 1220 mm multiplex, 2 x 2 SKADIS, Ropro 60+6 cm set.
    rear_tool_panel(
        x = right_tool_panel_x,
        z = tool_panel_bottom,
        width = right_tool_panel_width,
        height = tool_panel_height,
        backing_thickness = tool_panel_thickness,
        cleat_wall_length = right_cleat_wall_length,
        cleat_panel_lengths = [
            right_cleat_panel_piece_length,
            right_cleat_panel_piece_length
        ],
        cleat_height = cleat_profile_height,
        cleat_recess_depth = cleat_recess_depth,
        cleat_recess_clearance = cleat_recess_clearance,
        cleat_top_inset = cleat_top_inset,
        skadis_columns = 2,
        skadis_rows = 2,
        skadis_width = skadis_width,
        skadis_height = skadis_height,
        skadis_thickness = skadis_thickness,
        skadis_mount_gap = skadis_mount_gap,
        skadis_corner_radius = skadis_corner_radius,
        skadis_slot_width = skadis_slot_width,
        skadis_slot_height = skadis_slot_height,
        skadis_grid_pitch = skadis_grid_pitch,
        skadis_grid_offset = skadis_grid_offset,
        skadis_rail_length = skadis_rail_length,
        skadis_mount_point_z_inset = skadis_mount_point_z_inset,
        skadis_mount_head_diameter = skadis_mount_head_diameter,
        skadis_mount_head_depth = skadis_mount_head_depth,
        skadis_slot_pattern = slot_pattern,
        skadis_mount_points = skadis_mount_points_visible,
        skadis_mount_hardware = skadis_mount_hardware_visible,
        panel_visible = backing_visible,
        skadis_visible = skadis_visible,
        mounting_visible = mounting_visible,
        explode = explode
    );
}
