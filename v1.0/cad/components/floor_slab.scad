//
// Generic floor slab.
// Top surface is at Z = 0.
//

module floor_slab(width, depth, thickness) {
    translate([0, -depth, -thickness])
        cube([width, depth, thickness]);
}
