//
// Project component: garage rear wall with window and door openings.
// Garage interior is on negative Y.
// Exterior wall side is positive Y.
//

module rear_wall(
    width,
    height,
    thickness,
    window_x,
    window_z,
    window_width,
    window_height,
    door_x,
    door_width,
    door_height
) {
    difference() {
        cube([width, thickness, height]);

        // Window opening
        translate([window_x, -1, window_z])
            cube([
                window_width,
                thickness + 2,
                window_height
            ]);

        // Door opening
        translate([door_x, -1, 0])
            cube([
                door_width,
                thickness + 2,
                door_height
            ]);
    }
}
