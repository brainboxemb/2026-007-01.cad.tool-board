//
// Project component: garage workbench derived from the generic workbench.
//

include <../components/workbench.scad>

module garage_workbench(
    x,
    width,
    depth,
    height,
    top_thickness,
    leg_size,
    leg_inset
) {
    translate([x, 0, 0])
        workbench(
            width         = width,
            depth         = depth,
            height        = height,
            top_thickness = top_thickness,
            leg_size      = leg_size,
            leg_inset     = leg_inset
        );
}
