```@setup gruvbox
using MakieThemes, CairoMakie
```

# Gruvbox

The Gruvbox theme[^1] is accessible through `color_gruvbox_light()`
and `color_gruvbox_dark()`.

[^1]:
    <https://github.com/morhetz/gruvbox>;
    <https://github.com/gruvbox-community/gruvbox>

```julia
MakieThemes.demofigure(color_gruvbox_light())
```
```@raw html
<img src="../../assets/img/demofigure/gruvbox-light.png" alt="Gruvbox light color theme" width="900"/>
```

```julia
MakieThemes.demofigure(color_gruvbox_dark())
```
```@raw html
<img src="../../assets/img/demofigure/gruvbox-dark.png" alt="Gruvbox dark color theme" width="900"/>
```

```julia
MakieThemes.demoscatter(color_gruvbox_light())
```
```@raw html
<img src="../../assets/img/demoscatter/gruvbox-light.png" alt="Gruvbox light color theme" width="900"/>
```

```julia
MakieThemes.demoscatter(color_gruvbox_dark())
```
```@raw html
<img src="../../assets/img/demoscatter/gruvbox-dark.png" alt="Gruvbox dark color theme" width="900"/>
```

```@docs
color_gruvbox_light
color_gruvbox_dark
```
