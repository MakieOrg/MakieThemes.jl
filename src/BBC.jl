module BBC

using Makie, Colors

export theme_bbc, style_bbc, color_bbc, bbc

const bbc_black = Makie.to_color(colorant"#222222")
const bbc_red = Makie.to_color(colorant"#b90005")
const bbc_blue = Makie.to_color(colorant"#1380A1")
const bbc_yellow = Makie.to_color(colorant"#FAAB18")



function style_bbc(spinewidth = 1.5, gridwidth = 1.5)

    return Attributes(
        # fontsize = 15,
        # textsize = 15,
        Axis = (
            titlesize = 20,
            titlefont = :bold,
            titlegap = 4f0,
            titlealign = :left,
            # subtitlesize = 14,
            subtitlegap = 6f0,
            subtitlealign = :left,
            topspinevisible = false,
            rightspinevisible = false,
            bottomspinevisible = true,
            leftspinevisible = false,
            spinewidth = spinewidth,
            xticksvisible = false,
            yticksvisible = false,
            xticklabelsvisible = false,
            yticklabelsvisible = true,
            # xticklabelsize = 14,
            # yticklabelsize = 14,
            xminorgridvisible = false,
            yminorgridvisible = false,
            xgridvisible = false,
            ygridvisible = true,
            xgridwidth = gridwidth,
            ygridwidth = gridwidth,
        ),
        Axis3 = (
            titlesize = 20,
            titlefont = :bold,
            titlegap = 6f0,
            # subtitlesize = 14,
            subtitlegap = 6f0,
        ),
        Legend = (
            framevisible = false, 
            rowgap = 0,
            # labelsize = 14,
        ),
        # once Makie can support multiple faces in one font file,
        # uncomment the following:
        # fonts = (
        #     regular = "Helvetica",
        #     bold = "Helvetica Bold",
        #     italic = "Helvetica Italic",
        #     bold_italic = "Helvetica Bold Italic",
        # )
    )
end

function color_bbc()

    local bbc_black = Makie.to_color(colorant"#222222")
    local bbc_red = Makie.to_color(colorant"#b90005")
    local bbc_gridcolor = Makie.to_color(colorant"#cbcbcb")
    
    Attributes(
        color = bbc_black,
        textcolor = bbc_black,
        Axis = (
            titlecolor = bbc_black,
            subtitlecolor = bbc_black,
            topspinecolor = bbc_black,
            bottomspinecolor = bbc_black,
            leftspinecolor = bbc_black,
            rightspinecolor = bbc_black,
            xgridcolor = bbc_gridcolor,
            ygridcolor = bbc_gridcolor,
            xminorgridcolor = bbc_gridcolor,
            yminorgridcolor = bbc_gridcolor,
            xtickcolor = bbc_black,
            ytickcolor = bbc_black,
        ),
        Axis3 = (
            titlecolor = bbc_black,
            subtitlecolor = bbc_black,
            xspinecolor_1 = bbc_black,
            xspinecolor_2 = bbc_black,
            xspinecolor_3 = bbc_black,
            yspinecolor_1 = bbc_black,
            yspinecolor_2 = bbc_black,
            yspinecolor_3 = bbc_black,            
            zspinecolor_1 = bbc_black,
            zspinecolor_2 = bbc_black,
            zspinecolor_3 = bbc_black,
            xgridcolor = bbc_gridcolor,
            ygridcolor = bbc_gridcolor,
            zgridcolor = bbc_gridcolor,
            xtickcolor = bbc_black,
            ytickcolor = bbc_black,
            ztickcolor = bbc_black,
        ),
    )
end

"""
    theme_bbc()

This theme attempts to copy the `theme_bbc` from BBplot.
"""
function theme_bbc()

    return merge(
        style_bbc(),
        color_bbc(),
        # once Makie can support multiple faces in one font file,
        # uncomment the following:
        # fonts = (
        #     regular = "Helvetica",
        #     bold = "Helvetica Bold",
        #     italic = "Helvetica Italic",
        #     bold_italic = "Helvetica Bold Italic",
        # )
    )
end

bbc() = theme_bbc()

end