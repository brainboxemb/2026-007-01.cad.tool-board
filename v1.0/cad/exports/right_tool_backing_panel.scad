// Export entry point: right 720 x 1220 x 18 mm plywood backing panel.

include <../config.scad>
include <../components/backing_panel.scad>

recess_width = right_cleat_wall_length + 2 * cleat_recess_clearance;
recess_height = cleat_profile_height + 2 * cleat_recess_clearance;
recess_x = (right_tool_panel_width - recess_width) / 2;
cleat_z = tool_panel_height - cleat_top_inset - cleat_profile_height;
recess_z = cleat_z - cleat_recess_clearance;

backing_panel(
    width = right_tool_panel_width,
    height = tool_panel_height,
    thickness = tool_panel_thickness,
    recesses = [[
        recess_x,
        recess_z,
        recess_width,
        recess_height,
        cleat_recess_depth
    ]]
);
