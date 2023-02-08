module GGThemr

using ..MakieThemes
using Makie, Colors

export ggthemr, ggthemr_colorthemes


ggthemr_colorthemes() = collect(keys(ColorTheme))


function _theme_ggthemr() 
    return Attributes(
        linewidth = 2,

        fonts = (
            regular = "Noto Sans",
            bold = "Noto Sans Bold",
            italic = "Noto Sans Italic",
            bold_italic = "Noto Sans Bold Italic",
        ),

        Axis = Attributes(
            spinewidth = 1.5,
            bottomspinevisible = true,
            topspinevisible = false,
            leftspinevisible = true,
            rightspinevisible = false,
            xgridwidth = 2,
            ygridwidth = 2,
            xgridstyle = :dash,
            ygridstyle = :dash,
        ),

        Axis3 = Attributes(
            xspinewidth = 1.5,
            yspinewidth = 1.5,
            zspinewidth = 1.5,
            xspinestyle = :dash,
            yspinestyle = :dash,
            zspinestyle = :dash,
            xgridstyle = :dash,
            ygridstyle = :dash,
            zgridstyle = :dash,
        ),
        Legend = Attributes(
            bgcolor = :transparent,
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
    palettes = merge(Makie.default_palettes, Attributes(color = ct[:swatch][2:end]))

    Attributes(
        backgroundcolor = Makie.to_color(ct[:background]),
        palette = palettes,
        color = ct[:swatch][2], # maybe it should be ct[:swatch][1], this is the color to use in absence of grouping
        textcolor = ct[:swatch][2],
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
            xlabelcolor = Makie.to_color(ct[:text][2]),
            ylabelcolor = Makie.to_color(ct[:text][2]),
            xticklabelcolor = Makie.to_color(ct[:text][2]),
            yticklabelcolor = Makie.to_color(ct[:text][2]),
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

function ggthemr(theme::Symbol)

    merge(_theme_ggthemr(), color_ggthemr(theme))
end

const ColorTheme = Dict{Symbol, Dict{Symbol, Any}}()

include("palettes.jl")

end #module

