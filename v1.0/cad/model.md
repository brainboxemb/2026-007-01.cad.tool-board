# Garage layout model

Parametric OpenSCAD model for planning the garage layout.

The model and documentation were developed with the assistance of ChatGPT.

## Structure

- `main.scad` — main Customizer entry point.
- `config.scad` — project dimensions and visibility settings.
- `components/` — generic reusable components.
- `project_components/` — garage-specific components or wrappers derived from generic components.
- `assemblies/` — composed garage sections.
- `exports/` — dedicated geometry export entry points.
- `renders/` — dedicated camera/render entry points.

## Current geometry

- Rear wall: 3800 × 2600 mm.
- Concrete wall thickness: 90 mm.
- Window opening: 780 × 1340 mm, 480 mm from the left side and 200 mm below the ceiling.
- Window-to-door spacing: 740 mm.
- Door height: 2300 mm; door width is still provisional at 900 mm.
- Workbench: 1500 × 750 × 990 mm.
- Floor depth is provisional at 2000 mm until the garage depth is measured.

## Rear tool panels

The backing panels use the standard 1220 mm sheet dimension as their height. They are centred vertically relative to the 1340 mm window opening instead of being made as tall as the window.

- Window opening: Z = 1060–2400 mm.
- Backing panels: Z = 1120–2340 mm.
- This leaves 60 mm between each backing-panel edge and the corresponding top/bottom edge of the window opening.
- Two 560 mm SKÅDIS panels occupy 1120 mm vertically, leaving 50 mm of visible wood above and below them.

### Left

- Backing: 460 × 1220 × 18 mm, centred in the 480 mm wall strip left of the window.
- SKÅDIS: 1 × 2 panels of nominal 360 × 560 mm.
- Horizontal wood margin around SKÅDIS: 50 mm per side.
- Ropro mount: Heavy Duty French Cleat Z-Bar 30 cm set (300 mm wall profile + 300 mm counter profile).

### Right

- Backing: 720 × 1220 × 18 mm, centred in the 740 mm wall strip between window and door.
- SKÅDIS: 2 × 2 panels of nominal 360 × 560 mm.
- The two 360 mm panels use the full 720 mm backing width.
- Ropro mount: Heavy Duty French Cleat Z-Bar 60+6 cm set (600 mm wall profile + two 60 mm counter profiles).

## SKÅDIS component

`components/skadis_panel.scad` is now a reusable, recognisable SKÅDIS-style component rather than a plain rectangle.

It includes:

- 360 × 560 mm nominal dimensions;
- rounded outer corners;
- actual cut-out vertical peg slots;
- staggered 40 mm hole grids with a 20 mm offset;
- four visible board mounting points;
- an optional simplified 200 mm upper mounting rail and lower spacers.

IKEA publishes the 36 × 56 cm board size and shows that this size uses the supplied 20 cm wall rail. The exact slot geometry is not dimensioned by IKEA in the assembly document; the model uses the commonly documented SKÅDIS-compatible 5 × 15 mm slot geometry and staggered 40 mm grid for visualization/layout purposes.

## Routed Ropro recess

The Ropro profile is modelled using the published 38 mm profile height and 6 mm wall distance. The exact extrusion cross-section and screw-hole pattern remain intentionally simplified.

A 6 mm deep recess is routed into the back of each multiplex panel over the full length of the wall-side rail. The recess is 1 mm larger around the known 38 mm profile envelope. Routing only below the short counter-profile pieces would not clear the long wall rail.

With 18 mm multiplex, a 6 mm recess leaves 12 mm of material underneath the pocket. The final screw type/length for fixing the counter profile to the multiplex still needs to be checked before treating this as a fabrication-ready detail.

The garage interior is modelled on the negative Y side of the rear wall. The exterior side is positive Y.

## Product references

- Ropro Heavy Duty French Cleat Z-Bar Set 30 cm: https://www.ropro.eu/en/heavy-duty-french-cleat-z-bar-set-30cm.html
- Ropro Heavy Duty French Cleat Z-Bar Set 60+6 cm: https://www.ropro.eu/en/heavy-duty-french-cleat-z-bar-set-60-6cm.html
- IKEA SKÅDIS 36 × 56 cm: https://www.ikea.com/nl/nl/p/skadis-pegboard-zwart-80534372/
