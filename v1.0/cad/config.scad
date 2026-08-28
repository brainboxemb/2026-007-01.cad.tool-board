//
// Garage layout - configuration
// Units: millimetres
//

$fn = 48;


/* [View] */

show_rear_wall           = true;
show_left_wall           = true;
show_window_frame        = true;
show_door_frame          = true;
show_window_sill         = true;
show_workbench           = true;
show_floor               = true;
show_tool_backing_panels = true;
show_skadis_panels       = true;
show_tool_panel_mounts   = true;
show_skadis_slot_pattern = true;
show_skadis_mount_points = true;
show_skadis_mount_hardware = false;
show_reference_grid       = false;

/* [Reference grid] */

// Rear-wall dimensional reference grid.
reference_grid_pitch      = 100; // 10 cm
reference_grid_line_width = 2;
reference_grid_depth      = 1;

// Move multiplex + SKADIS towards the garage to inspect the concealed mount.
tool_panel_explode = 0; // [0:5:150]


/* [Garage walls] */

wall_width     = 3800;
wall_height    = 2600;

// Concrete / structural inner shell only.
// Additional exterior wall layers can be added later.
wall_thickness = 90;

// Temporary left-wall depth follows the currently modelled floor depth.
// This will become the measured garage depth later.
left_wall_depth = 2000;


/* [Window opening] */

// Inside view: measured from the left side of the rear wall.
window_left_offset = 480;
window_width       = 780;
window_height      = 1340;
window_top_offset  = 200;

window_bottom = wall_height - window_top_offset - window_height;


/* [Window sill] */

// Projection into the garage from the inside face of the wall.
window_sill_thickness  = 20;
window_sill_depth      = 20;
window_sill_side_extra = 20;


/* [Door opening] */

// Horizontal distance between the right side of the window opening
// and the left side of the door opening.
window_to_door = 740;

// Width is provisional until measured.
door_width  = 900;
door_height = 2300;

door_left = window_left_offset + window_width + window_to_door;


/* [Exterior frames] */

// Simplified visualization. Both frames sit on the exterior side
// of the 90 mm concrete wall.
frame_border = 50;
frame_depth  = 60;


/* [Workbench] */

workbench_width  = 1500;
workbench_depth  = 750;
workbench_height = 990;

workbench_top_thickness = 40;
workbench_leg_size      = 70;
workbench_leg_inset     = 60;

// Inside view: workbench starts at the left end of the rear wall.
workbench_x = 0;


/* [Tool panel backing] */

// Use the 1220 mm sheet dimension directly.
// Align the bottom edge with the TOP of the 20 mm window sill.
// The sill top coincides with the bottom of the window opening.
tool_panel_height = 1220;
tool_panel_bottom = window_bottom;
tool_panel_top    = tool_panel_bottom + tool_panel_height;

tool_panel_thickness = 18;

// Left wall strip is 480 mm; keep 10 mm free on each side.
left_tool_panel_width = 460;
left_tool_panel_x = (window_left_offset - left_tool_panel_width) / 2;

// Right wall strip between window and door is 740 mm; keep 10 mm each side.
right_tool_panel_width = 720;
right_tool_panel_x =
    window_left_offset + window_width
    + (window_to_door - right_tool_panel_width) / 2;


/* [SKADIS] */

skadis_width  = 360;
skadis_height = 560;
skadis_thickness = 5;

// Approximate stand-off created by the original IKEA wall rail/spacers.
skadis_mount_gap = 15;

// Geometry used for the recognisable SKADIS pattern.
skadis_corner_radius = 9;
skadis_slot_width    = 5;
skadis_slot_height   = 15;
skadis_grid_pitch    = 40;
skadis_grid_offset   = 20;

// The 36 cm board uses the supplied 20 cm wall rail. The four visible board
// fasteners are modelled at the corresponding left/right positions.
skadis_rail_length = 200;
skadis_mount_point_z_inset = 20;
skadis_mount_head_diameter = 12;
skadis_mount_head_depth = 2;


/* [Tool panel mounting - Ropro] */

// Ropro Heavy Duty French Cleat / Z-bar known dimensions.
cleat_profile_height = 38;
cleat_wall_distance  = 6;

// Route the full wall-rail envelope into the back of the 18 mm multiplex.
// This leaves 12 mm of multiplex below the recess and must be considered
// when selecting screws for the panel-side counter profile.
cleat_recess_depth = 6;
cleat_recess_clearance = 1;

// Position rail near the upper edge, safely above the panel centre of gravity.
cleat_top_inset = 50;

// Left panel: Ropro Heavy Duty 30 cm set (300 + 300 mm).
left_cleat_wall_length  = 300;
left_cleat_panel_length = 300;

// Right panel: Ropro Heavy Duty 60+6 cm set:
// 600 mm wall rail + two 60 mm panel-side counter profiles.
right_cleat_wall_length = 600;
right_cleat_panel_piece_length = 60;


/* [Floor] */

// Temporary depth until the complete garage depth is measured.
floor_depth     = 2000;
floor_thickness = 100;
