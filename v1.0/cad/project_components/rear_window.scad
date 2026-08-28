//
// Project component: rear window frame and interior sill.
//

include <../components/opening_frame.scad>

module rear_window_frame(
    x,
    z,
    wall_thickness,
    opening_width,
    opening_height,
    frame_border,
    frame_depth
) {
    translate([x, wall_thickness, z])
        opening_frame(
            opening_width  = opening_width,
            opening_height = opening_height,
            border         = frame_border,
            depth          = frame_depth,
            include_bottom = true
        );
}

module rear_window_sill(
    x,
    z,
    opening_width,
    thickness,
    depth,
    side_extra
) {
    // Sill projects into the garage (negative Y).
    translate([
        x - side_extra,
        -depth,
        z - thickness
    ])
        cube([
            opening_width + 2 * side_extra,
            depth,
            thickness
        ]);
}
