module BBC

using Makie, Colors

export theme_bbc

function theme_bbc()

    bbc_black = Makie.to_color(colorant"#222222")
    bbc_gridcolor = Makie.to_color(colorant"#cbcbcb")

    return Attributes(
        color = bbc_black,
        fontsize = 18,
        textsize = 18,
        Axis = (
            titlesize = 28,
            titlefont = :bold,
            titlecolor = bbc_black,
            titlegap = 9f0,
            titlealign = :left,
            subtitlesize = 22,
            subtitlecolor = bbc_black,
            subtitlegap = 9f0,
            subtitlealign = :left,
            topspinevisible = false,
            rightspinevisible = false,
            bottomspinevisible = true,
            leftspinevisible = false,
            spinewidth = 1.5,
            xticksvisible = false,
            yticksvisible = false,
            xticklabelsvisible = false,
            yticklabelsvisible = true,
            xticklabelsize = 18,
            yticklabelsize = 18,
            xminorgridvisible = false,
            yminorgridvisible = false,
            xgridvisible = false,
            ygridvisible = true,
            ygridwidth = 1.5,
            ygridcolor = bbc_gridcolor,
        ),
        Axis3 = (
            titlesize = 28,
            titlefont = :bold,
            titlecolor = bbc_black,
            titlegap = 9f0,
            subtitlesize = 22,
            subtitlecolor = bbc_black,
            subtitlegap = 9f0,
        ),
        Legend = (
            framevisible = false, 
            labelsize = 18,
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

end