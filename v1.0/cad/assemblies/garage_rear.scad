//
// Assembly: current rear section of the garage.
// Expects config.scad to be included by the calling file.
//

include <../project_components/rear_wall.scad>
include <../project_components/left_wall.scad>
include <../project_components/rear_window.scad>
include <../project_components/rear_door.scad>
include <../project_components/garage_workbench.scad>
include <../project_components/garage_floor.scad>
include <../project_components/rear_tool_panels.scad>
include <../components/reference_grid.scad>

module garage_rear_scene(
    rear_wall_visible     = true,
    left_wall_visible     = true,
    window_frame_visible  = true,
    door_frame_visible    = true,
    window_sill_visible   = true,
    workbench_visible     = true,
    floor_visible         = true,
    tool_backing_visible  = true,
    skadis_visible        = true,
    tool_mounts_visible   = true,
    skadis_slots_visible  = true,
    skadis_mount_points_visible = true,
    skadis_mount_hardware_visible = false,
    reference_grid_visible = false,
    reference_grid_pitch_value = 100,
    reference_grid_line_width_value = 2,
    reference_grid_depth_value = 1,
    tool_panels_explode   = 0
) {
    if (floor_visible)
        color([0.68, 0.68, 0.68])
            garage_floor(
                width     = wall_width,
                depth     = floor_depth,
                thickness = floor_thickness
            );

    if (rear_wall_visible)
        color([0.82, 0.82, 0.80])
            rear_wall(
                width         = wall_width,
                height        = wall_height,
                thickness     = wall_thickness,
                window_x      = window_left_offset,
                window_z      = window_bottom,
                window_width  = window_width,
                window_height = window_height,
                door_x        = door_left,
                door_width    = door_width,
                door_height   = door_height
            );

    if (reference_grid_visible)
        color([0.85, 0.15, 0.15, 0.45])
            reference_grid_xz(
                width      = wall_width,
                height     = wall_height,
                pitch      = reference_grid_pitch_value,
                line_width = reference_grid_line_width_value,
                depth      = reference_grid_depth_value,
                y          = -1.5
            );

    if (left_wall_visible)
        color([0.82, 0.82, 0.80])
            left_wall(
                depth     = left_wall_depth,
                height    = wall_height,
                thickness = wall_thickness
            );

    if (window_frame_visible)
        color([0.25, 0.25, 0.25])
            rear_window_frame(
                x              = window_left_offset,
                z              = window_bottom,
                wall_thickness = wall_thickness,
                opening_width  = window_width,
                opening_height = window_height,
                frame_border   = frame_border,
                frame_depth    = frame_depth
            );

    if (door_frame_visible)
        color([0.25, 0.25, 0.25])
            rear_door_frame(
                x              = door_left,
                wall_thickness = wall_thickness,
                opening_width  = door_width,
                opening_height = door_height,
                frame_border   = frame_border,
                frame_depth    = frame_depth
            );

    if (window_sill_visible)
        color([0.88, 0.88, 0.86])
            rear_window_sill(
                x             = window_left_offset,
                z             = window_bottom,
                opening_width = window_width,
                thickness     = window_sill_thickness,
                depth         = window_sill_depth,
                side_extra    = window_sill_side_extra
            );

    if (workbench_visible)
        color([0.58, 0.39, 0.22])
            garage_workbench(
                x             = workbench_x,
                width         = workbench_width,
                depth         = workbench_depth,
                height        = workbench_height,
                top_thickness = workbench_top_thickness,
                leg_size      = workbench_leg_size,
                leg_inset     = workbench_leg_inset
            );

    if (tool_backing_visible || skadis_visible || tool_mounts_visible)
        rear_tool_panels(
            backing_visible = tool_backing_visible,
            skadis_visible  = skadis_visible,
            mounting_visible = tool_mounts_visible,
            slot_pattern    = skadis_slots_visible,
            skadis_mount_points_visible = skadis_mount_points_visible,
            skadis_mount_hardware_visible = skadis_mount_hardware_visible,
            explode         = tool_panels_explode
        );

}
