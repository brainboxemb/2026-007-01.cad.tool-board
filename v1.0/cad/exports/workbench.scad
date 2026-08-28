// Export entry point: workbench only

include <../config.scad>
include <../project_components/garage_workbench.scad>

garage_workbench(
    x             = 0,
    width         = workbench_width,
    depth         = workbench_depth,
    height        = workbench_height,
    top_thickness = workbench_top_thickness,
    leg_size      = workbench_leg_size,
    leg_inset     = workbench_leg_inset
);
