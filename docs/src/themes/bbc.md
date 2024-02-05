```@setup bbc
using MakieThemes, CairoMakie
```

# BBC

The BBC theme is accessible through `theme_bbc()`.  You can get the BBC red color through `MakieThemes.BBC.bbc_red`.

```julia
MakieThemes.demofigure(theme_bbc())
```
```@raw html
<img src="../../assets/img/demofigure/bbc.png" alt="BBC theme" width="900"/>
```

```julia
MakieThemes.demoscatter(theme_bbc())
```
```@raw html
<img src="../../assets/img/demoscatter/bbc.png" alt="BBC theme" width="900"/>
```

The `finalize_plot` functionality in `bbplot` is planned for the near future, so stay tuned!

```@docs
theme_bbc
```