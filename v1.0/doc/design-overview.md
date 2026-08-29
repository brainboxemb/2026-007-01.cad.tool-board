# Design overview — v1.0

This document collects the visual views used to evaluate the current tool-board concept for the rear wall of the garage.

The project is primarily a private design study. The OpenSCAD model is used as a dimensional and visual aid for workshop / home-design choices rather than as a photorealistic room-planning model.

## Concept and implementation

### Visual concept

The concept image communicates the intended appearance and overall composition. It is not a dimensional CAD render and should not be treated as authoritative geometry.

![Tool-board concept render](../../_images/tool-board-concept-render.jpg)

### OpenSCAD implementation

The corresponding OpenSCAD view is the dimensional implementation used to verify proportions and placement.

![Rear tool panels](../out/png/tool-board-rear-tool-panels.png)

## Angled rear-wall view

![Rear tool panels — angled](../out/png/tool-board-rear-tool-panels-angled.png)

The angled view is taken from inside the garage at approximately standing eye height, looking towards the rear wall. It is intended to show the tool-board layout in a natural workshop perspective while also making depth and the relationship with the left wall, floor and workbench easier to judge.


## 100 mm reference-grid view

![Rear tool panels with 100 mm grid](../out/png/tool-board-rear-tool-panels-grid.png)

This render adds a 100 mm reference grid across the rear-wall plane. The grid is a visual measuring aid and can also be enabled interactively from the OpenSCAD Customizer.

The plywood backing panels are aligned with the **top of the window sill**. With the current dimensions, the backing panels run from 1060 mm to 2280 mm above floor level.

## SKÅDIS component detail

![SKÅDIS component](../out/png/tool-board-skadis-component.png)

This view shows the reusable SKÅDIS component with its rounded corners, slot pattern and visible mounting points.

## Render generation

The images under `v1.0/out/png/` are generated automatically by the repository's GitHub Actions workflow from the OpenSCAD entry points in:

```text
v1.0/cad/renders/
```

The render entry-point files themselves do not contain the `tool-board-` prefix; the build workflow adds that prefix to the generated PNG filenames.
