module GGThemr

using AbstractPlotting, Colors

export ggthemr, show_ggthemr

function show_ggthemr(theme::Symbol)
    AbstractPlotting.set_theme!(ggthemr(theme))
    scene = scatter(randn(20), randn(20), markersize = 0.2)
    scatter!(scene, randn(20), randn(20), markersize = 0.2)
    scatter!(scene, randn(20), randn(20), markersize = 0.2)
    scatter!(scene, randn(20), randn(20), markersize = 0.2)
    scatter!(scene, randn(20), randn(20), markersize = 0.2)
end


const ggthemr_style = Theme(
    linewidth = 3,
    axis = Theme(
        frame = Theme(
            linewidth = 5,
            frames = ((true, false), (true, false))
        ),
        grid = Theme(
            linewidth = (4, 4),
            linestyle = (:dash, :dash),
        ),
        ticks = Theme(
            textsize = (5,5),
        ),
    ),
)

const ColorTheme = Dict{Symbol, Dict{Symbol, Any}}()

function ggthemr(theme::Symbol)
    ct = ColorTheme[theme]
    merge(ggthemr_style, Theme(
        color = AbstractPlotting.Palette(ct[:color]),
        axis = Theme(
            frame = Theme(
                linecolor = parse(Color, ct[:axiscolor])
            ),
            grid = Theme(
                linecolor = (parse(Color, ct[:gridcolor]), parse(Color, ct[:gridcolor]))
            ),
            ticks = Theme(
                textcolor = (parse(Color, ct[:tickcolor]), parse(Color, ct[:tickcolor]))
            ),
            names = Theme(
                textcolor = (parse(Color, ct[:tickcolor]), parse(Color, ct[:tickcolor]))
            ),
        ),
        scatter = Theme(
            strokecolor = parse(Color, ct[:markerstrokecolor]),
        ),
    ))
end

ColorTheme[:fresh] = Dict(
    :color =>  ["#65ADC2", "#233B43",
                "#E84646", "#C29365",
                "#362C21", "#316675",
                "#168E7F", "#109B37"],
    :axiscolor => "#826a50",
    :gridcolor => "#eee4da",
    :tickcolor => "#111111",
    :markerstrokecolor => "white"
)

end # module
