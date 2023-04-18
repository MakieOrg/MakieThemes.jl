# MakieThemes


[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://makieorg.github.io/MakieThemes.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://makieorg.github.io/MakieThemes.jl/dev/)
[![Build Status](https://github.com/MakieOrg/MakieThemes.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/MakieOrg/MakieThemes.jl/actions/workflows/CI.yml?query=branch%3Amaster)


The idea of this package is to create a collection of themes for Makie to customize
the size and look of plot elements and colors. It will initially focus on porting
themes from existing plotting packages.

Currently, we provide the following libraries:
- `GGThemr` - inspired by [ggthemr](https://github.com/cttobin/ggthemr), a R library for ggplot themes.
- `BBC` - emulating the BBC's plot style, found in [bbplot](https://github.com/bbc/bbplot).

We do plan to add more themes, and PRs are welcome!

Here's the current default look of Makie:

```julia
using Makie, MakieThemes
Makie.demoscatter()
```
<img src="https://raw.githubusercontent.com/MakieOrg/MakieThemes.jl/gh-pages/dev/assets/img/demoscatter/default.png" alt="default" width="500"/>

Using the `:fresh` theme from `GGThemr`;
```julia
using MakieThemes
MakieThemes.demoscatter(theme_ggthemr(:fresh))
```
<img src="https://raw.githubusercontent.com/MakieOrg/MakieThemes.jl/gh-pages/dev/assets/img/demoscatter/fresh.png" alt="ggthemr" width="500"/>

Here's an expanded visualization based on the examples in the source theme:

<details>
<summary>Code</summary>

```julia
using CSV, DataFrames, MakieThemes, Makie, AlgebraOfGraphics
for dataset ∈ (:www, :drivers, :mtcars, :diamonds)
  @eval $(dataset) = CSV.read(dirname(pathof(MakieThemes))*"/../data/"*$(string(dataset))*".tsv", delim = '\t', DataFrame)
end

Makie.set_theme!(ggthemr(:fresh))

fig = Figure()

www_plot = data(www) * mapping(:Minute, :Users, color = :Measure) * (visual(Lines) + visual(Scatter) * mapping(marker = :Measure))
www_grid = draw!(fig[1, 1], www_plot)
legend!(fig[1, 1, Top()], www_grid; orientation = :horizontal, titleposition = :left)

mtcars_plot = data(mtcars) * mapping(:mpg, color = :cyl => nonnumeric) * AlgebraOfGraphics.density()
mtcars_grid = draw!(fig[1, 2], mtcars_plot)
legend!(fig[1, 2, Top()], mtcars_grid; orientation = :horizontal, titleposition = :left)

diamonds_plot = data(diamonds) * mapping(:price, color = :cut, stack = :cut) * AlgebraOfGraphics.histogram()
draw!(fig[2, 1], diamonds_plot; axis = (xtickformat = x -> string.(round.(Int, x)),))

drivers_plot = data(drivers) * mapping(:Year, :Deaths) * visual(BoxPlot)
draw!(fig[2, 2], drivers_plot)

fig
```

</details>
<img src="https://raw.githubusercontent.com/MakieOrg/MakieThemes.jl/gh-pages/dev/assets/img/ggthemr_full_fresh.png" alt="MakieThemes" width="650"/>

This is the target theme I'm aiming for (image created with R)
<img src="https://raw.githubusercontent.com/MakieOrg/MakieThemes.jl/gh-pages/dev/assets/img/fresh_ggthemr_r.png" alt="GGThemr in R" width="650"/>

## Color v/s style themes

In MakieThemes, we try to maintain a separation between _color_ themes (dark v/s light theme, background colors, palettes, etc) and _style_ themes (fonts, grid styles, title alignments, etc).  This provides a lot of flexibility - you might 

#### Current issues:
- [ ] axis line thickness
- [ ] the period of the dashed line
