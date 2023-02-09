# MakieThemes

WIP

The idea of this package is to create a collection of themes for Makie to customize
the size and look of plot elements and colors. It will initially focus on porting
themes from existing plotting packages.

Currently I've started work on a `GGThemr` library, that aims to emulate the themes
at https://github.com/cttobin/ggthemr .

Here's the current default look of Makie on my machine:

```julia
using Makie, MakieThemes
Makie.demoscatter()
```
<img src="https://raw.githubusercontent.com/JuliaPlots/MakieThemes.jl/gh-pages/previews/PR16/assets/img/demoscatter/default.png" alt="default" width="500"/>

Using the `:fresh` theme from `GGThemr`
```julia
using MakieThemes
MakieThemes.demoscatter(:fresh)
```
<img src="https://raw.githubusercontent.com/JuliaPlots/MakieThemes.jl/gh-pages/previews/PR16/assets/img/demoscatter/fresh.png" alt="ggthemr" width="500"/>

Here's an expanded visualization based on the examples in the source theme:
```julia
using CSV, DataFrames, MakieThemes, Makie, AlgebraOfGraphics
for dataset ∈ (:www, :drivers, :mtcars, :diamonds)
  @eval $(dataset) = CSV.read(dirname(pathof(MakieThemes))*"/../data/"*$(string(dataset))*".tsv", delim = '\t', DataFrame)
end

Makie.set_theme!(ggthemr(:fresh))

fig = Figure()

www_grid = draw!(fig[1, 1], data(www) * mapping(:Minute, :Users, color = :Measure, marker = :Measure) * (visual(Lines) + visual(Scatter)))
legend!(fig[1, 1, Top()], www_grid; orientation = :horizontal, titleposition = :left)


mtcars_grid = draw!(fig[1, 2], data(mtcars) * mapping(:mpg, color = :cyl => nonnumeric) * AlgebraOfGraphics.density())

legend!(fig[1, 2, Top()], mtcars_grid; orientation = :horizontal, titleposition = :left)

diamonds_grid = draw!(fig[2, 1], 
    data(diamonds) * mapping(:price, color = :cut, stack = :cut) * AlgebraOfGraphics.histogram(); 
    axis = (xtickformat = x -> string.(round.(Int, x)),)
  )

drivers_grid = draw!(fig[2, 2], data(drivers) * mapping(:Year, :Deaths) * visual(BoxPlot))

fig
```
![ggthemr_full](https://raw.githubusercontent.com/JuliaPlots/MakieThemes.jl/gh-pages/previews/PR16/assets/img/demofigure/fresh.png)

This is the target theme I'm aiming for (image created with R)
![ggthemr](img/fresh_ggthemr_r.png)

#### Current issues:
- [x] font sizes vary, and the font is too bold
- [x] alignments across subpanels
- [ ] axis line thickness
- [ ] the period of the dashed line
- [x] overplotting of the axes by the dashed line
- [x] the missing legends
- [x] outliers and median marker for the boxplots
- [x] reversed colors for the histogram
- [x] colored fill area
- [x] labelling of x and y axes
- [x] implicit position of the 0,0 point within axes
- [x] no white edge around marker points


Currently supported theme libraries are:
- [ggthemr](ggthemr.md)
- [bbplot](bbplot.md)
