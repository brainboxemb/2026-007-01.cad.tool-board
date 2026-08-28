//
// Project component: left garage wall.
// Coordinate system follows the rear-wall model:
// - rear inside face is Y = 0
// - garage extends towards negative Y
// - left inside face is X = 0
//

module left_wall(
    depth,
    height,
    thickness
) {
    translate([-thickness, -depth, 0])
        cube([
            thickness,
            depth,
            height
        ]);
}
