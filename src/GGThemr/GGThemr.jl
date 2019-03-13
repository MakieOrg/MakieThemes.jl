module GGThemr

using AbstractPlotting, Colors

export ggthemr, show_ggthemr, ggthemr_colorthemes

function show_ggthemr(theme::Symbol)
    AbstractPlotting.set_theme!(ggthemr(theme))
    scene = scatter(randn(20), randn(20), markersize = 0.2)
    scatter!(scene, randn(20), randn(20), markersize = 0.2)
    scatter!(scene, randn(20), randn(20), markersize = 0.2)
    scatter!(scene, randn(20), randn(20), markersize = 0.2)
    scatter!(scene, randn(20), randn(20), markersize = 0.2)
end

ggthemr_colorthemes() = collect(keys(ColorTheme))


const ggthemr_style = Theme(
    linewidth = 2,
    font = "NotoSans",
    axis2d = Theme(
        frame = Theme(
            linewidth = 1.5,
            frames = ((true, false), (true, false))
        ),
        grid = Theme(
            linewidth = (2, 2),
            linestyle = (:dash, :dash),
        ),
        ticks = Theme(
            textsize = (4.5, 4.5),
        ),
    ),
    scatter = Theme(
        markersize = 6,
        strokewidth = 2,
    )
)

function ggthemr(theme::Symbol)
    ct = ColorTheme[theme]
    palettes = merge(AbstractPlotting.default_palettes, Attributes(color = ct[:swatch][2:end]))
    merge(ggthemr_style, Theme(
        palette = palettes,
        color = ct[:swatch][2], # maybe it should be ct[:swatch][1], this is the color to use in absence of grouping
        backgroundcolor = parse(Color, ct[:background]),
        #colorgradient = parse(Color, ct[:gradient]),
        axis = Theme(
            frame = Theme(
                linecolor = parse(Color, ct[:line][2])
            ),
            grid = Theme(
                linecolor = (parse(Color, ct[:gridline]), parse(Color, ct[:gridline]))
            ),
            ticks = Theme(
                textcolor = (parse(Color, ct[:text][2]), parse(Color, ct[:text][2]))
            ),
            names = Theme(
                textcolor = (parse(Color, ct[:text][2]), parse(Color, ct[:text][2]))
            ),
        ),
        scatter = Theme(
            strokecolor = parse(Color, ct[:background]),
        ),
    ))
end

const ColorTheme = Dict{Symbol, Dict{Symbol, Any}}()

include("palettes.jl")

end #module
