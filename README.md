# MakieThemes

Very WIP

The idea of this package is to create a collection of themes for Makie to customize
the size and look of plot elements and colors. It will initially focus on porting
themes from existing plotting packages (hence the GPL-3 license).

Currently I've started work on a `GGThemr` library, that aims to emulate the themes
at https://github.com/cttobin/ggthemr

Here's the current default look of Makie on my machine:

```julia
using Makie
scene = scatter(randn(20), randn(20), markersize = 0.2)
scatter!(scene, randn(20), randn(20), markersize = 0.2)
scatter!(scene, randn(20), randn(20), markersize = 0.2)
scatter!(scene, randn(20), randn(20), markersize = 0.2)
scatter!(scene, randn(20), randn(20), markersize = 0.2)
```
<img src="img/default.png" alt="default" width="500"/>

Using the `:fresh` theme from `GGThemr`
```julia
using MakieThemes
show_ggthemr(:fresh)
```
<img src="img/fresh.png" alt="ggthemr" width="500"/>

This is the target theme I'm aiming for (image created with R)
![ggthemr](img/fresh_ggthemr_r.png)

Currently supported themes are:

### flat

<img src="img/flat.png" alt="flat" width="400"/>

### dust

<img src="img/dust.png" alt="dust" width="400"/>

### fresh

<img src="img/fresh.png" alt="fresh" width="400"/>

### carrot

<img src="img/carrot.png" alt="carrot" width="400"/>

### flat_dark

<img src="img/flat_dark.png" alt="carrot" width="400"/>

### sky

<img src="img/sky.png" alt="sky" width="400"/>

### copper

<img src="img/copper.png" alt="copper" width="400"/>

### light

<img src="img/light.png" alt="light" width="400"/>

### pale

<img src="img/pale.png" alt="pale" width="400"/>

### solarized

<img src="img/solarized.png" alt="solarized" width="400"/>

### sea

<img src="img/sea.png" alt="sea" width="400"/>

### chalk

<img src="img/chalk.png" alt="chalk" width="400"/>

### greyscale

<img src="img/greyscale.png" alt="greyscale" width="400"/>

### earth

<img src="img/earth.png" alt="earth" width="400"/>

### lilac

<img src="img/lilac.png" alt="lilac" width="400"/>

### grass

<img src="img/grass.png" alt="grass" width="400"/>

### grape

<img src="img/grape.png" alt="grape" width="400"/>
