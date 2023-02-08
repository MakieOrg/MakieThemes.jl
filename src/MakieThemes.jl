module MakieThemes

using Makie, Colors

include("GGThemr/GGThemr.jl")

using .GGThemr
export ggthemr, show_ggthemr, ggthemr_colorthemes

include("BBC/BBC.jl")
using .BBC
export theme_bbc

using Random

function demofigure()
    Random.seed!(2)

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

    f
end



end # module
