```@setup gruvbox
using MakieThemes, CairoMakie
```

# Gruvbox

The Gruvbox theme[^1] is a color-only theme. Preferred entry points are
`color_gruvbox(mode::Symbol = :light)` and the alias `theme_gruvbox`.
Wrappers `color_gruvbox_light()` and `color_gruvbox_dark()` remain available.

[^1]:
    <https://github.com/morhetz/gruvbox>;
    <https://github.com/gruvbox-community/gruvbox>

```julia
using Makie, MakieThemes

set_theme!(color_gruvbox(:light))
set_theme!(color_gruvbox(:dark))
set_theme!(theme_gruvbox(:dark))  # alias for color_gruvbox
```

## Light

```julia
MakieThemes.demofigure(color_gruvbox(:light))
```
```@raw html
<img src="../../assets/img/demofigure/gruvbox-light.png" alt="Gruvbox light color theme" width="900"/>
```

```julia
MakieThemes.demoscatter(color_gruvbox(:light))
```
```@raw html
<img src="../../assets/img/demoscatter/gruvbox-light.png" alt="Gruvbox light color theme" width="900"/>
```

## Dark

```julia
MakieThemes.demofigure(color_gruvbox(:dark))
```
```@raw html
<img src="../../assets/img/demofigure/gruvbox-dark.png" alt="Gruvbox dark color theme" width="900"/>
```

```julia
MakieThemes.demoscatter(color_gruvbox(:dark))
```
```@raw html
<img src="../../assets/img/demoscatter/gruvbox-dark.png" alt="Gruvbox dark color theme" width="900"/>
```

```@docs
color_gruvbox
theme_gruvbox
color_gruvbox_light
color_gruvbox_dark
```
