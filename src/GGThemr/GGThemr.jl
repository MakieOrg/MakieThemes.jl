module GGThemr

using Makie, Colors

export ggthemr, show_ggthemr, ggthemr_colorthemes

function show_ggthemr(theme::Symbol; legend_vertical = true, legend_outside_axis = true)
    Makie.with_theme(ggthemr(theme)) do
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
    ),

    Axis3 = Attributes(
        xspinewidth = 1.5,
        yspinewidth = 1.5,
        zspinewidth = 1.5,

    ),
    Legend = Attributes(
        bgcolor = :transparent,
        framevisible = false,
    ),
    Scatter = Attributes(
        markersize = 15,
        strokewidth = 2,
    ),

)

function ggthemr(theme::Symbol)
    ct = ColorTheme[theme]
    palettes = merge(Makie.default_palettes, Attributes(color = ct[:swatch][2:end]))
    merge(ggthemr_style, Attributes(
        backgroundcolor = Makie.to_color(ct[:background]),
        palette = palettes,
        color = ct[:swatch][2], # maybe it should be ct[:swatch][1], this is the color to use in absence of grouping
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
        ),
        Legend = Attributes(
            framecolor = Makie.to_color(ct[:line][2]),
        ),
        Scatter = Attributes(
            strokecolor = Makie.to_color(ct[:background]),
        ),
    ))
end

const ColorTheme = Dict{Symbol, Dict{Symbol, Any}}()

include("palettes.jl")

end #module

