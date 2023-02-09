```@setup bbc
using MakieThemes, CairoMakie
```

# BBC

The BBC theme is accessible through `theme_bbc()`.  You can get the BBC red color through `MakieThemes.BBC.bbc_red`.

```@example bbc
MakieThemes.demofigure(theme_bbc())
```

```@example bbc
MakieThemes.demoscatter(theme_bbc())
```

The `finalize_plot` functionality in `bbplot` is planned for the near future, so stay tuned!