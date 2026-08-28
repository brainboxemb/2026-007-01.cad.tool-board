# v1.0 Design Overview

This document collects the generated OpenSCAD views for the current garage-layout v1.0 model in one place. It is intended as a quick visual reference while evaluating dimensions, proportions, material choices and mounting concepts.

The model is primarily a private design aid rather than an architectural representation. Some components are therefore deliberately simplified where additional detail does not yet influence a design decision.

## Rear-wall storage layout

![Rear-wall tool panels](../out/png/tool-board-rear_tool_panels.png)

This front-oriented view is the main reference for the current rear-wall concept. It shows the two plywood backing panels around the existing window:

- left backing panel: 460 × 1220 × 18 mm;
- right backing panel: 720 × 1220 × 18 mm;
- black IKEA SKÅDIS panels in their normal 360 × 560 mm orientation;
- workbench below the left side;
- door opening to the right.

The backing-panel height is 1220 mm. Their vertical placement is derived from the window rather than simply matching the full window height.

## Complete rear-wall context

![Garage rear overview](../out/png/tool-board-garage_rear.png)

This perspective view shows the rear-wall model in spatial context, including the floor section, left wall, window, door and workbench. It is useful mainly for checking how far elements project into the garage and for gradually extending the model beyond the rear wall.

## Rear wall without storage emphasis

![Rear wall](../out/png/tool-board-rear_wall.png)

The simplified rear-wall view is useful when checking the fixed architectural references before additional storage or furniture is considered.

## SKÅDIS component detail

![SKÅDIS component](../out/png/tool-board-skadis_component.png)

The SKÅDIS component is modelled separately so it can be reused elsewhere in the garage model. The current component includes:

- 360 × 560 mm outer dimensions;
- rounded corners;
- repeated slot pattern;
- visible mounting points;
- black finish, matching the intended physical panels.

The geometry is intended to make the panel recognisable and dimensionally useful without reproducing every manufacturing detail.

## Concealed backing-panel mounting

![Tool-panel mounting exploded](../out/png/tool-board-tool_panel_mounting_exploded.png)

This exploded view is used to inspect the concealed ROPRO Heavy Duty French-cleat / Z-bar concept behind the plywood.

Current concept:

- left panel: 300 mm ROPRO Heavy Duty set;
- right panel: 600 + 60 mm ROPRO Heavy Duty set;
- 6 mm recessed area routed into the rear of the 18 mm plywood;
- approximately 12 mm of plywood remains locally after routing;
- lower spacers / bumpers can keep the panel parallel to the concrete wall.

The final screw and concrete-anchor selection is deliberately not fixed yet because the actual load capacity depends on the wall condition, fastener geometry and intended tool load.

## Top view

![Top view](../out/png/tool-board-top_view.png)

The top view helps with depth and clearance decisions. As the rest of the garage is added, this view can become one of the main layout-comparison views for benches, storage and machines.

## Generated images

The images above are generated from the fixed OpenSCAD entry points under `v1.0/cad/renders/` and are stored in `v1.0/out/png/`. Keeping the render entry points separate from `main.scad` makes it possible to regenerate the same documentation views automatically later.

Current render files:

- `garage_rear.scad` → `tool-board-garage_rear.png`
- `rear_tool_panels.scad` → `tool-board-rear_tool_panels.png`
- `rear_wall.scad` → `tool-board-rear_wall.png`
- `skadis_component.scad` → `tool-board-skadis_component.png`
- `tool_panel_mounting_exploded.scad` → `tool-board-tool_panel_mounting_exploded.png`
- `top_view.scad` → `tool-board-top_view.png`
