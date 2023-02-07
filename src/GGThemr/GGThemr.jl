module GGThemr

using Makie, Colors

export ggthemr, show_ggthemr, ggthemr_colorthemes

function show_ggthemr(theme::Symbol)
    Makie.with_theme(ggthemr(theme)) do
        fig, ax, p1 = scatter(randn(20), randn(20), markersize = 0.2)
        scatter!(ax, randn(20), randn(20), markersize = 0.2)
        scatter!(ax, randn(20), randn(20), markersize = 0.2)
        scatter!(ax, randn(20), randn(20), markersize = 0.2)
        scatter!(ax, randn(20), randn(20), markersize = 0.2)
        return fig
    end
end

ggthemr_colorthemes() = collect(keys(ColorTheme))


const ggthemr_style = Attributes(
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
        xticklabelsize = 4.5,
        yticklabelsize = 4.5,
    ),

    Axis3 = Attributes(
        spinewidth = 1.5,
        showgrid = true,
        showticks = true,
        xticklabelsize = 4.5,
        yticklabelsize = 4.5,
        zticklabelsize = 4.5,
        ticks = Attributes(
            textsize = (4.5, 4.5, 4.5),
        )
    ),

    Scatter = Attributes(
        markersize = 6,
        strokewidth = 2,
    ),

)

function ggthemr(theme::Symbol)
    ct = ColorTheme[theme]
    palettes = merge(AbstractPlotting.default_palettes, Attributes(color = ct[:swatch][2:end]))
    merge(ggthemr_style, Attributes(
        palette = palettes,
        color = ct[:swatch][2], # maybe it should be ct[:swatch][1], this is the color to use in absence of grouping
        backgroundcolor = Makie.to_color(ct[:background]),
        #colorgradient = parse(Color, ct[:gradient]),
        Axis = Attributes(
            topspinecolor = Makie.to_color(ct[:line][2]),
            bottomspinecolor = Makie.to_color(ct[:line][2]),
            leftspinecolor = Makie.to_color(ct[:line][2]),
            rightspinecolor = Makie.to_color(ct[:line][2]),
            xgridcolor = Makie.to_color(ct[:gridline]),
            ygridcolor = Makie.to_color(ct[:gridline]),
            # xminorgridcolor = Makie.to_color(ct[:gridline]),
            # yminorgridcolor = Makie.to_color(ct[:gridline]),
            xlabelcolor = Makie.to_color(ct[:text][2]),
            ylabelcolor = Makie.to_color(ct[:text][2]),
            xticklabelcolor = Makie.to_color(ct[:text][2]),
            yticklabelcolor = Makie.to_color(ct[:text][2]),
        ),
        Scatter = Attributes(
            strokecolor = Makie.to_color(ct[:background]),
        ),
    ))
end

const ColorTheme = Dict{Symbol, Dict{Symbol, Any}}()

include("palettes.jl")

end #module
