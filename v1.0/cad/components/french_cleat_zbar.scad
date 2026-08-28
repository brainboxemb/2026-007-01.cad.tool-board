//
// Simplified visual envelope for a metal French-cleat / Z-bar profile.
//
// The exact Ropro extrusion cross-section and screw-hole pattern are not
// reproduced here. The known product envelope used by this model is:
// - profile height: 38 mm
// - assembled wall distance: 6 mm
//

module french_cleat_zbar_envelope(
    length,
    height = 38,
    depth = 6
) {
    cube([length, depth, height]);
}
