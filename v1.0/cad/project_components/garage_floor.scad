//
// Project component: current garage floor area.
//

include <../components/floor_slab.scad>

module garage_floor(width, depth, thickness) {
    floor_slab(
        width     = width,
        depth     = depth,
        thickness = thickness
    );
}
