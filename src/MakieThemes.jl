module MakieThemes

using Makie, Colors

include("sGGThemr.jl")

using .GGThemr
export theme_ggthemr, ggthemr, style_ggthemr, color_ggthemr, ggthemr_colorthemes

include("BBC.jl")
using .BBC
export theme_bbc, style_bbc, color_bbc

using Random

"""
    demofigure([theme::Attributes])

Shows off a demonstration figure with the given `theme` (defaults to the current theme).
The figure contains scatters, surfaces, bands, and barplots, as well as legends, titles, etc.
It is able to show off most aspects of the theme!
"""
function demofigure(theme::Attributes = Makie.current_default_theme())
    Random.seed!(2)
    with_theme(theme) do
        f = Makie.Figure()
        ax = Makie.Axis(f[1, 1],
            title = "Measurements",
            subtitle = "Example-5000 oscilloscope at 3 Hz",
            xlabel = "time (s)",
            ylabel = "amplitude")

        labels = ["alpha", "beta", "gamma", "delta", "epsilon", "zeta"]
        for i in 1:6
            y = cumsum(randn(10)) .* (isodd(i) ? 1 : -1)
            Makie.lines!(y, label = labels[i])
            Makie.scatter!(y, label = labels[i])
        end

        Makie.Legend(f[1, 2], ax, "legend", merge = true)

        Makie.Axis3(f[1, 3],
            viewmode = :stretch,
            zlabeloffset = 40,
            title = "sinusoid")

        s = Makie.surface!(0:0.5:10, 0:0.5:10, (x, y) -> sqrt(x * y) + sin(1.5x))

        Makie.Colorbar(f[1, 4], s, label = "intensity")

        ax = Makie.Axis(f[2, 1:2],
            title = "different species",
            xlabel = "height (m)",
            ylabel = "density",)
        for i in 1:6
            y = randn(200) .+ 2i
            Makie.density!(y)
        end
        Makie.tightlimits!(ax, Bottom())
        Makie.xlims!(ax, -1, 15)

        Makie.Axis(f[2, 3:4],
            title = "stock performance",
            xticks = (1:6, labels),
            xlabel = "company",
            ylabel = "gain (\$)",
            xticklabelrotation = pi/6)
        for i in 1:6
            data = randn(1)
            Makie.barplot!([i], data)
            Makie.rangebars!([i], data .- 0.2, data .+ 0.2)
        end

        return f
    end
end

"""
    demoscatter([theme::Attributes]; legend_vertical = true, legend_outside_axis = true)

Shows off a demonstration scatter plot with the given `theme` (defaults to the current theme).
A legend is also plotted.
"""
function demoscatter(theme::Attributes = Makie.current_default_theme(); legend_vertical = true, legend_outside_axis = true)
    Makie.with_theme(theme) do
        fig, ax, p1 = scatter(randn(20), randn(20); label = "Variable 1")
        scatter!(ax, randn(20), randn(20); label = "Variable 2")
        scatter!(ax, randn(20), randn(20); label = "Variable 3")
        scatter!(ax, randn(20), randn(20); label = "Variable 4")
        scatter!(ax, randn(20), randn(20); label = "Variable 5")

        if legend_outside_axis
            if legend_vertical
                Legend(fig[1, 2], ax)
            else
                Legend(fig[2, 1], ax; orientation = :horizontal)
            end
        else
            axislegend(ax; orientation = legend_vertical ? :vertical : :horizontal)
        end
        return fig
    end
end

end # module
