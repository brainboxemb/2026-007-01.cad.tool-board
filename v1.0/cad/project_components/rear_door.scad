//
// Project component: rear door frame.
// Frame is placed on the exterior side of the concrete wall.
//

include <../components/opening_frame.scad>

module rear_door_frame(
    x,
    wall_thickness,
    opening_width,
    opening_height,
    frame_border,
    frame_depth
) {
    translate([x, wall_thickness, 0])
        opening_frame(
            opening_width  = opening_width,
            opening_height = opening_height,
            border         = frame_border,
            depth          = frame_depth,
            include_bottom = false
        );
}
