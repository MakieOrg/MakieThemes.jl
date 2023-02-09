```@meta
CurrentModule = MakieThemes
```

```@setup env
using MakieThemes, Makie, CairoMakie
CairoMakie.activate!(type="png", px_per_unit = 2)
```

# MakieThemes

The idea of this package is to create a collection of themes for Makie to customize
the size and look of plot elements and colors. It will initially focus on porting
themes from existing plotting packages.

Currently, we have the following theme libraries:

- `GGThemr`, that emulates the themes at https://github.com/cttobin/ggthemr.  Accessed by `ggthemr(:colorscheme)`.
- `BBC`, that emulates the [bbplot](https://github.com/bbc/bbplot) R package released by the BBC.  (Note that this does not include the lower bar with logo/label, though that may come in time as a utility).  Accessed by `theme_bbc()`.

To view all accessible themes, go to the GGThemr or BBC pages on the sidebar!

There are two main ways to visualize themes which `MakieThemes` provides, the `demofigure` and `demoscatter` functions.
These are visualized below with Makie's default theme, as a baseline:

```@example env
MakieThemes.demofigure()
```

```@example env
MakieThemes.demoscatter()
```

## The concept of MakieThemes

In MakieThemes, we try to maintain a separation between _color themes_ (dark v/s light theme, background colors, palettes, etc) and _style themes_ (fonts, grid styles, title alignments, etc). 

This provides a lot of flexibility - you might mix the BBC's style with GGThemr's flat color scheme, simply using `merge(style_bbc(), color_ggthemr(:flat))`!

The way this is implemented is simple: each theme is implemented internally as separate color and style themes.  Take the example of `GGThemr`'s structure below:

```julia
color_ggthemr(:colortheme)  # implemented as color theme
style_ggthemr()             # implemented as style theme
theme_ggthemr(:colortheme) = merge(color_ggthemr(:colortheme), style_ggthemr())
```

In this way, you can stitch together various colour and style themes with ease.  

```@example env
MakieThemes.demofigure(merge(style_bbc(), color_ggthemr(:fresh)))
```
