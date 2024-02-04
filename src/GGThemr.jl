module GGThemr

using ..MakieThemes
using Makie, Colors

export theme_ggthemr, ggthemr, style_ggthemr, color_ggthemr, ggthemr_colorthemes


ggthemr_colorthemes() = collect(keys(ColorTheme))


function style_ggthemr(basewidth = 2, spinewidth = basewidth * 0.75) 
    return Attributes(
        linewidth = basewidth,

        fonts = (
            regular = "Noto Sans",
            bold = "Noto Sans Bold",
            italic = "Noto Sans Italic",
            bold_italic = "Noto Sans Bold Italic",
        ),

        Axis = Attributes(
            spinewidth = spinewidth,
            bottomspinevisible = true,
            topspinevisible = false,
            leftspinevisible = true,
            rightspinevisible = false,
            xgridwidth = basewidth,
            ygridwidth = basewidth,
            xgridstyle = :dash,
            ygridstyle = :dash,
        ),

        Axis3 = Attributes(
            xspinewidth = spinewidth,
            yspinewidth = spinewidth,
            zspinewidth = spinewidth,
            xspinestyle = :dash,
            yspinestyle = :dash,
            zspinestyle = :dash,
            xgridstyle = :dash,
            ygridstyle = :dash,
            zgridstyle = :dash,
        ),
        Legend = Attributes(
            backgroundcolor = :transparent,
            framevisible = false,
        ),
        Scatter = Attributes(
            markersize = 15,
            strokewidth = 0,
        ),
    )
end

function color_ggthemr(theme::Symbol)
    ct = ColorTheme[theme]
    palettes = merge(
      Attributes(
        color = ct[:swatch][2:end],
        patchcolor = ct[:swatch][2:end],
      ),
      Makie.DEFAULT_PALETTES, 
    )

    Attributes(
        backgroundcolor = Makie.to_color(ct[:background]),
        palette = palettes,
        color = ct[:swatch][2], # maybe it should be ct[:swatch][1], this is the color to use in absence of grouping
        textcolor = ct[:text][2],
        colormap = Makie.to_colormap(Makie.to_color.(ct[:gradient])),
        Axis = Attributes(
            backgroundcolor = :transparent,
            topspinecolor = Makie.to_color(ct[:line][2]),
            bottomspinecolor = Makie.to_color(ct[:line][2]),
            leftspinecolor = Makie.to_color(ct[:line][2]),
            rightspinecolor = Makie.to_color(ct[:line][2]),
            xgridcolor = Makie.to_color(ct[:gridline]),
            ygridcolor = Makie.to_color(ct[:gridline]),
            xminorgridcolor = Makie.to_color(ct[:gridline]),
            yminorgridcolor = Makie.to_color(ct[:gridline]),
            xtickcolor = Makie.to_color(ct[:gridline]),
            ytickcolor = Makie.to_color(ct[:gridline]),
        ),
        Axis3 = Attributes(
            xspinecolor_1 = Makie.to_color(ct[:line][2]),
            xspinecolor_2 = Makie.to_color(ct[:line][2]),
            xspinecolor_3 = Makie.to_color(ct[:line][2]),
            yspinecolor_1 = Makie.to_color(ct[:line][2]),
            yspinecolor_2 = Makie.to_color(ct[:line][2]),
            yspinecolor_3 = Makie.to_color(ct[:line][2]),            
            zspinecolor_1 = Makie.to_color(ct[:line][2]),
            zspinecolor_2 = Makie.to_color(ct[:line][2]),
            zspinecolor_3 = Makie.to_color(ct[:line][2]),
            xgridcolor = Makie.to_color(ct[:gridline]),
            ygridcolor = Makie.to_color(ct[:gridline]),
            zgridcolor = Makie.to_color(ct[:gridline]),
            xtickcolor = Makie.to_color(ct[:gridline]),
            ytickcolor = Makie.to_color(ct[:gridline]),
            ztickcolor = Makie.to_color(ct[:gridline]),
        ),
        Legend = Attributes(
            framecolor = Makie.to_color(ct[:line][2]),
        ),
        Scatter = Attributes(
            strokecolor = Makie.to_color(ct[:background]),
        ),
    )
end

function theme_ggthemr(theme::Symbol)
    merge(style_ggthemr(), color_ggthemr(theme))
end

ggthemr(theme) = theme_ggthemr(theme)

const ColorTheme = Dict{Symbol, Dict{Symbol, Any}}()


ColorTheme[:fresh] = Dict(
  :background => "#ffffff",
  :text       => ["#555555", "#111111"],
  :line       => ["#826A50", "#362C21"],
  :gridline   => "#eee4da",
  :swatch     => ["#111111", "#65ADC2", "#233B43", "#E84646", "#C29365", "#362C21", "#316675", "#168E7F", "#109B37"],
  :gradient   => ["#65ADC2","#362C21"]
)

ColorTheme[:earth] = Dict(
  :background => "#36312C",
  :text       => ["#555555", "#F8F8F0"],
  :line       => ["#ffffff", "#827D77"],
  :gridline   => "#504940",
  :swatch     => ["#F8F8F0", "#DB784D", "#95CC5E", "#E84646", "#F8BB39", "#7A7267", "#E1AA93", "#168E7F", "#2B338E"],
  :gradient   => ["#7A7267", "#DB784D"]
)

ColorTheme[:flat] = Dict(
    :background => "#ecf0f1",
    :text       => ["#34495e", "#34495e"],
    :line       => ["#2c3e50", "#7f8c8d"],
    :gridline   => "#bdc3c7",
    :swatch     => ["#34495e", "#3498db", "#2ecc71", "#f1c40f", "#e74c3c", "#9b59b6", "#1abc9c", "#f39c12", "#d35400"],
    :gradient   => ["#f1c40f", "#c0392b"]
)

ColorTheme[:flat_dark] = Dict(
    :background => "#34495e",
    :text       => ["#34495e", "#ecf0f1"],
    :line       => ["#2c3e50", "#7f8c8d"],
    :gridline   => "#46627f",
    :swatch     => ["#ecf0f1", "#3498db", "#2ecc71", "#f1c40f", "#e74c3c", "#9b59b6", "#1abc9c", "#f39c12", "#d35400"],
    :gradient   => ["#f1c40f", "#c0392b"]
)

ColorTheme[:dust] = Dict(
    :background => "#FAF7F2",
    :text       => ["#5b4f41", "#5b4f41"],
    :line       => ["#8d7a64", "#8d7a64"],
    :gridline   => "#E3DDCC",
    :swatch     => ["#555555", "#db735c", "#EFA86E", "#9A8A76", "#F3C57B", "#7A6752", "#2A91A2", "#87F28A", "#6EDCEF"],
    :gradient   => ["#F3C57B", "#7A6752"]
)

ColorTheme[:light] = Dict(
    :background => "#f6f1eb",
    :text       => ["#706f6f", "#706f6f"],
    :line       => ["#dadada", "#785d37"],
    :gridline   => "#dadada",
    :swatch     => ["#785d37", "#62bba5", "#ffb84d", "#aaa488", "#b2432f", "#3a6589", "#9b5672", "#908150", "#373634"],
    :gradient   => ["#62bba5", "#373634"]
)

ColorTheme[:chalk] = Dict(
  :background => "#3c3c3c",
  :text       => ["#3c3c3c", "#ffffff"],
  :line       => ["#ffffff", "#ffffff"],
  :gridline   => "#777777",
  :swatch     => ["#ffffff", "#c2c5be", "#d4dada", "#111111", "#6D8875", "#eaeaea", "#908a78"],
  :gradient   => ["#ffffff", "#111111"]
)

ColorTheme[:lilac] = Dict(
  :background => "#FFFDD0",
  :text       => ["#5f5e3a", "#5f5e3a"],
  :line       => ["#B2B080", "#B2B080"],
  :gridline   => "#E5E4BB",
  :swatch     => ["#555555", "#886EB2", "#C29DFF", "#B2B06E", "#DDE8B2", "#689940", "#B96CBF", "#403F34", "#ffffff"],
  :gradient   => ["#D2B6FF", "#555555"]
)

ColorTheme[:carrot] = Dict(
  :background => "#EC7C47",
  :text       => ["#6C3921", "#ffffff"],
  :line       => ["#AC5B34", "#AC5B34"],
  :gridline   => "#D26F3F",
  :swatch     => ["#6C3921", "#45764A", "#63AB5E", "#ffffff", "#B05D34", "#6C4F41", "#EFAE90", "#109F92", "#47ECDD"],
  :gradient   => ["#FBE2D6", "#45764A"]
)

ColorTheme[:pale] = Dict(
  :background => "#ffffff",
  :text       => ["#444444", "#444444"],
  :line       => ["#d1d1d1", "#eaeaea"],
  :gridline   => "#eaeaea",
  :swatch     => ["#444444", "#de6757", "#EB9050", "#3262AB", "#FF8D7D", "#C8E370", "#C45B4D", "#41a65c", "#5E2C25"],
  :gradient   => ["#C8E370", "#de6757"]
)

ColorTheme[:copper] = Dict(
  :background => "#e1965d",
  :text       => ["#614128", "#0d0905"],
  :line       => ["#614128", "#f4d7c1"],
  :gridline   => "#e9b288",
  :swatch     => ["#0d0905", "#614128", "#AE7448", "#f2f0ee", "#E6C1A4", "#EE6C56", "#208794", "#37AE79", "#5DD2E1"],
  :gradient   => ["#f2f0ee", "#614128"]
)

ColorTheme[:grape] = Dict(
  :background => "#e8ece5",
  :text       => ["#6b3241", "#6b3241"],
  :line       => ["#bbb8ab", "#bbb8ab"],
  :gridline   => "#bbb8ab",
  :swatch     => ["#0b0e0a", "#9b3950", "#f79b57", "#6b3241", "#e65e62", "#9e7587", "#4C8659", "#6B6C69", "#0b0e0a"],
  :gradient   => ["#e5c8cf", "#6b3241"]
)

ColorTheme[:greyscale] = Dict(
  :background => "#ffffff",
  :text       => ["#444444", "#444444"],
  :line       => ["#909090", "#909090"],
  :gridline   => "#D0D0D0",
  :swatch     => ["#000000", "#515151", "#909090", "#D0D0D0", "#444444", "#111111", "#eaeaea", "#666666", "#000000"],
  :gradient   => ["#d0d0d0", "#000000"]
)

ColorTheme[:sky] = Dict(
  :background => "#bfeaf8",
  :text       => ["#59595c", "#59595c"],
  :line       => ["#739EAB", "#ffffff"],
  :gridline   => "#ffffff",
  :swatch     => ["#59595c", "#739EAB", "#2C3639", "#36555E", "#f99e93", "#c43d31"],
  :gradient   => ["#f99e93", "#2C3639"]
)

ColorTheme[:solarized] = Dict(
  :background => "#fdf6e3",
  :text       => ["#586e75", "#586e75"],
  :line       => ["#073642", "#073642"],
  :gridline   => "#eee8d5",
  :swatch     => ["#073642", "#268bd2", "#dc322f", "#2aa198", "#b58900", "#6c71c4", "#d33682"],
  :gradient   => ["#dc322f", "#268bd2"]
)

ColorTheme[:grass] = Dict(
  :background => "#64a756",
  :text       => ["#2F4D28", "#2F4D28"],
  :line       => ["#d6eecb", "#d6eecb"],
  :gridline   => "#a4d98b",
  :swatch     => ["#4A3D4F", "#CEF3C6", "#ded42f", "#B45454", "#3E6735", "#be1d2d", "#57826F"],
  :gradient   => ["#ded42f", "#B45454"]
)

ColorTheme[:sea] = Dict(
  :background => "#27a4f8",
  :text       => ["#27a4f8", "#fcfbf9"],
  :line       => ["#b9c8c3", "#b9c8c3"],
  :gridline   => "#b9c8c3",
  :swatch     => ["#135078", "#f0f0f0", "#F1F14C", "#135078", "#F94240", "#cbe9fd", "#F9A765", "#092639", "#C5430B"],
  :gradient   => ["#f0f0f0", "#092639"]
)


end #module

