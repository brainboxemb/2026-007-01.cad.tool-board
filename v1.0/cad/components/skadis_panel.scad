//
// Generic IKEA SKADIS-style 36 x 56 cm pegboard component.
//
// Local coordinate system:
// - mounting surface is Y = 0
// - board projects towards negative Y (garage interior)
// - X is left/right
// - Z is bottom/top
//
// The nominal outer dimensions and the original mounting rail length come
// from IKEA. The slot geometry is modelled as the commonly documented SKADIS
// dual 40 mm grid with a 20 mm stagger. It is intended for layout/detail
// visualization rather than manufacturing an IKEA replacement panel.
//

module _skadis_rounded_rect_2d(width, height, radius) {
    translate([radius, radius])
        offset(r = radius)
            square([
                width - 2 * radius,
                height - 2 * radius
            ]);
}

module _skadis_slot_2d(width = 5, height = 15) {
    straight = max(0, height - width);

    hull() {
        translate([0, -straight / 2])
            circle(d = width, $fn = 20);

        translate([0, straight / 2])
            circle(d = width, $fn = 20);
    }
}

module _skadis_face_2d(
    width,
    height,
    corner_radius,
    slot_width,
    slot_height,
    grid_pitch,
    grid_offset,
    slots = true
) {
    difference() {
        _skadis_rounded_rect_2d(
            width = width,
            height = height,
            radius = corner_radius
        );

        if (slots) {
            // Grid A: 20,20 relative to the outer edge; 40 mm pitch.
            for (
                x = [grid_offset : grid_pitch : width - grid_offset],
                z = [grid_offset : grid_pitch : height - grid_offset]
            )
                translate([x, z])
                    _skadis_slot_2d(
                        width = slot_width,
                        height = slot_height
                    );

            // Grid B: same grid shifted 20 mm in both directions.
            for (
                x = [2 * grid_offset : grid_pitch : width - 2 * grid_offset],
                z = [2 * grid_offset : grid_pitch : height - 2 * grid_offset]
            )
                translate([x, z])
                    _skadis_slot_2d(
                        width = slot_width,
                        height = slot_height
                    );
        }
    }
}

module skadis_board(
    width = 360,
    height = 560,
    thickness = 5,
    corner_radius = 9,
    slot_width = 5,
    slot_height = 15,
    grid_pitch = 40,
    grid_offset = 20,
    slots = true
) {
    // 2D X/Z face extruded towards negative Y.
    rotate([90, 0, 0])
        linear_extrude(height = thickness, convexity = 10)
            _skadis_face_2d(
                width = width,
                height = height,
                corner_radius = corner_radius,
                slot_width = slot_width,
                slot_height = slot_height,
                grid_pitch = grid_pitch,
                grid_offset = grid_offset,
                slots = slots
            );
}

module skadis_mounting_hardware(
    width = 360,
    height = 560,
    rail_length = 200,
    mount_gap = 15,
    rail_height = 20,
    rail_depth = 4,
    lower_spacer_diameter = 14,
    lower_spacer_depth = 15,
    mount_z_inset = 20
) {
    mount_x0 = (width - rail_length) / 2;

    // Simplified original upper wall rail. It is deliberately only an
    // envelope; the exact stamped-steel profile is not required for layout.
    color([0.62, 0.64, 0.66])
        translate([
            mount_x0,
            -rail_depth,
            height - mount_z_inset - rail_height / 2
        ])
            cube([
                rail_length,
                rail_depth,
                rail_height
            ]);

    // Lower spacers keep the panel parallel with the mounting surface.
    for (x = [mount_x0, mount_x0 + rail_length])
        color([0.45, 0.47, 0.49])
            translate([x, 0, mount_z_inset])
                rotate([90, 0, 0])
                    cylinder(
                        h = lower_spacer_depth,
                        d = lower_spacer_diameter,
                        $fn = 28
                    );
}

module skadis_mounting_points(
    width = 360,
    height = 560,
    thickness = 5,
    mount_gap = 15,
    rail_length = 200,
    z_inset = 20,
    head_diameter = 12,
    head_depth = 2
) {
    x_left  = (width - rail_length) / 2;
    x_right = x_left + rail_length;

    // IKEA uses four visible board fasteners: two into the upper rail and
    // two into the lower spacers. They pass through the pegboard slots; these
    // raised discs make those mounting points visible in the garage model.
    for (
        x = [x_left, x_right],
        z = [z_inset, height - z_inset]
    )
        color([0.76, 0.76, 0.74])
            translate([
                x,
                -mount_gap - thickness,
                z
            ])
                rotate([90, 0, 0])
                    cylinder(
                        h = head_depth,
                        d = head_diameter,
                        $fn = 32
                    );
}

module skadis_panel(
    width = 360,
    height = 560,
    thickness = 5,
    mount_gap = 15,
    corner_radius = 9,
    slot_width = 5,
    slot_height = 15,
    grid_pitch = 40,
    grid_offset = 20,
    rail_length = 200,
    mount_point_z_inset = 20,
    mount_head_diameter = 12,
    mount_head_depth = 2,
    slot_pattern = true,
    mounting_points = true,
    mounting_hardware = false,
    board_color = [0.035, 0.035, 0.035]
) {
    if (mounting_hardware)
        skadis_mounting_hardware(
            width = width,
            height = height,
            rail_length = rail_length,
            mount_gap = mount_gap,
            mount_z_inset = mount_point_z_inset
        );

    color(board_color)
        translate([0, -mount_gap, 0])
            skadis_board(
                width = width,
                height = height,
                thickness = thickness,
                corner_radius = corner_radius,
                slot_width = slot_width,
                slot_height = slot_height,
                grid_pitch = grid_pitch,
                grid_offset = grid_offset,
                slots = slot_pattern
            );

    if (mounting_points)
        skadis_mounting_points(
            width = width,
            height = height,
            thickness = thickness,
            mount_gap = mount_gap,
            rail_length = rail_length,
            z_inset = mount_point_z_inset,
            head_diameter = mount_head_diameter,
            head_depth = mount_head_depth
        );
}
