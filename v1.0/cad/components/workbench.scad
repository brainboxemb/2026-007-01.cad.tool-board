//
// Generic workbench component
//

module workbench(
    width,
    depth,
    height,
    top_thickness = 40,
    leg_size = 70,
    leg_inset = 60
) {
    top_z = height - top_thickness;
    leg_height = top_z;

    // Worktop
    translate([0, -depth, top_z])
        cube([width, depth, top_thickness]);

    // Rear left leg
    translate([
        leg_inset,
        -leg_size - leg_inset,
        0
    ])
        cube([leg_size, leg_size, leg_height]);

    // Rear right leg
    translate([
        width - leg_inset - leg_size,
        -leg_size - leg_inset,
        0
    ])
        cube([leg_size, leg_size, leg_height]);

    // Front left leg
    translate([
        leg_inset,
        -depth + leg_inset,
        0
    ])
        cube([leg_size, leg_size, leg_height]);

    // Front right leg
    translate([
        width - leg_inset - leg_size,
        -depth + leg_inset,
        0
    ])
        cube([leg_size, leg_size, leg_height]);
}
