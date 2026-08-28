//
// Generic planar reference grid.
//
// The grid lies in the X/Z plane. `y` controls its position in depth.
// It is intended as a visual measuring aid only.
//

module reference_grid_xz(
    width,
    height,
    pitch = 100,
    line_width = 2,
    depth = 1,
    y = -0.5
) {
    // Vertical grid lines.
    for (x = [0 : pitch : width])
        translate([x - line_width / 2, y - depth / 2, 0])
            cube([line_width, depth, height]);

    // Horizontal grid lines.
    for (z = [0 : pitch : height])
        translate([0, y - depth / 2, z - line_width / 2])
            cube([width, depth, line_width]);
}
