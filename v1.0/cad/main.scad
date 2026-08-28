//
// Garage layout - main model
//

include <config.scad>
include <assemblies/garage_rear.scad>

garage_rear_scene(
    rear_wall_visible     = show_rear_wall,
    left_wall_visible     = show_left_wall,
    window_frame_visible  = show_window_frame,
    door_frame_visible    = show_door_frame,
    window_sill_visible   = show_window_sill,
    workbench_visible     = show_workbench,
    floor_visible         = show_floor,
    tool_backing_visible  = show_tool_backing_panels,
    skadis_visible        = show_skadis_panels,
    tool_mounts_visible   = show_tool_panel_mounts,
    skadis_slots_visible  = show_skadis_slot_pattern,
    skadis_mount_points_visible = show_skadis_mount_points,
    skadis_mount_hardware_visible = show_skadis_mount_hardware,
    tool_panels_explode   = tool_panel_explode
);
