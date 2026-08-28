//
// Generic backing panel with optional routed recesses in the back face.
//
// Local coordinate system:
// - X: left to right
// - Y: back face at Y = 0, front projects towards negative Y
// - Z: bottom to top
//
// recesses: [x, z, width, height, depth]
//

module backing_panel(
    width,
    height,
    thickness,
    recesses = []
) {
    difference() {
        translate([0, -thickness, 0])
            cube([width, thickness, height]);

        for (r = recesses) {
            recess_x      = r[0];
            recess_z      = r[1];
            recess_width  = r[2];
            recess_height = r[3];
            recess_depth  = r[4];

            // Pocket is routed from the back face into the panel.
            translate([
                recess_x,
                -recess_depth - 0.01,
                recess_z
            ])
                cube([
                    recess_width,
                    recess_depth + 0.02,
                    recess_height
                ]);
        }
    }
}
