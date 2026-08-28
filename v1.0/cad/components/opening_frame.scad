//
// Generic rectangular three/four-sided opening frame.
// The opening starts at [0, 0, 0].
//

module opening_frame(
    opening_width,
    opening_height,
    border,
    depth,
    include_bottom = true
) {
    // Left
    translate([-border, 0, -border])
        cube([
            border,
            depth,
            opening_height + 2 * border
        ]);

    // Right
    translate([opening_width, 0, -border])
        cube([
            border,
            depth,
            opening_height + 2 * border
        ]);

    // Top
    translate([0, 0, opening_height])
        cube([
            opening_width,
            depth,
            border
        ]);

    if (include_bottom)
        translate([0, 0, -border])
            cube([
                opening_width,
                depth,
                border
            ]);
}
