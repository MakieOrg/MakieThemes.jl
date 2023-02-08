```@meta
CurrentModule = MakieThemes
```

```@setup env
using MakieThemes, Makie, CairoMakie
CairoMakie.activate(type="svg")
```

# MakieThemes


WIP

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

```@index
```

```@autodocs
Modules = [MakieThemes]
```
