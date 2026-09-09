# Flexoki color themes for Makie.
# Flexoki palette copyright (c) 2023 Steph Ango, MIT license:
# https://github.com/kepano/flexoki — see LICENSE-Flexoki.md.
# Light accents use the 600 ramp; dark accents use the 400 ramp.
#
# These themes set colors (including spine, tick, grid, and frame colors) but
# no structural chrome, so they compose with any Makie style theme. In Makie's
# merge the first theme wins, so put Flexoki first, e.g.
#   set_theme!(merge(color_flexoki(:light), theme_light()))
#   set_theme!(merge(color_flexoki(:dark), theme_dark()))
# or theme_flexoki() / theme_flexoki(:dark).
#
# Note: Flexoki is designed to match Flexoki desktop/editor themes. The
# sequential colormap and accent cycle are aesthetic, not scientifically
# designed perceptual / colorblind-safe colormaps, and are not recommended
# for publications that need accurate quantitative color encoding.

module Flexoki

using Makie, Colors

export color_flexoki, theme_flexoki

"""
    flexoki_palette(background, accents)

Return the plot palette `Attributes` for a Flexoki background color and accent
cycle. `patchcolor` is blended toward the background so legend patches stay
legible on the given surface.
"""
function flexoki_palette(background, accents)
    bgc = to_color(background)
    patched = [Makie.lerp(bgc, to_color(c), 0.8f0) for c in accents]
    return merge(
        Attributes(
            color = collect(accents),
            patchcolor = patched,
        ),
        Makie.DEFAULT_PALETTES,
    )
end

"""
    flexoki_sequential(stops)

Return a `cgrad` sequential colormap through the given color stops.
"""
function flexoki_sequential(stops)
    return cgrad(collect(stops))
end

"""
    color_flexoki(tokens::NamedTuple)

Build a color-only Makie theme from Flexoki semantic tokens. Sets
background, text, line, palette, colormap, and 3D lighting colors, plus the
color of axis borders/spines, ticks, grids, and legend/colorbar frames. No
structural chrome (visibility, widths, paddings, tick sizes, etc.) is
applied, so the result composes with any style theme.
"""
function color_flexoki(tokens::NamedTuple)
    ui3 = tokens.ui3
    tx2 = tokens.tx2
    grid = tokens.grid
    return Attributes(
        backgroundcolor = tokens.bg,
        textcolor = tokens.tx,
        linecolor = tokens.tx,
        palette = flexoki_palette(tokens.bg, tokens.accents),
        colormap = tokens.colormap,
        ambient = tokens.ambient,
        light_color = tokens.light_color,
        Axis = (
            backgroundcolor = tokens.bg,
            xgridcolor = grid,
            ygridcolor = grid,
            leftspinecolor = ui3,
            rightspinecolor = ui3,
            bottomspinecolor = ui3,
            topspinecolor = ui3,
            xtickcolor = tx2,
            ytickcolor = tx2,
            xminortickcolor = tx2,
            yminortickcolor = tx2,
        ),
        Legend = (
            backgroundcolor = tokens.bg,
            framecolor = ui3,
        ),
        Colorbar = (
            backgroundcolor = tokens.bg,
            topspinecolor = ui3,
            bottomspinecolor = ui3,
            leftspinecolor = ui3,
            rightspinecolor = ui3,
            tickcolor = tx2,
        ),
        Axis3 = (
            xgridcolor = grid,
            ygridcolor = grid,
            zgridcolor = grid,
            xspinecolor_1 = ui3,
            yspinecolor_1 = ui3,
            zspinecolor_1 = ui3,
            xspinecolor_2 = ui3,
            yspinecolor_2 = ui3,
            zspinecolor_2 = ui3,
            xspinecolor_3 = ui3,
            yspinecolor_3 = ui3,
            zspinecolor_3 = ui3,
            xspinecolor_4 = ui3,
            yspinecolor_4 = ui3,
            zspinecolor_4 = ui3,
            xtickcolor = tx2,
            ytickcolor = tx2,
            ztickcolor = tx2,
        ),
    )
end

##
# Flexoki 2.0 palette
const FLEXOKI_BLACK = colorant"#100F0F"
const FLEXOKI_PAPER = colorant"#FFFCF0"

const FLEXOKI_BASE = Dict(
    50 => colorant"#F2F0E5",
    100 => colorant"#E6E4D9",
    150 => colorant"#DAD8CE",
    200 => colorant"#CECDC3",
    300 => colorant"#B7B5AC",
    400 => colorant"#9F9D96",
    500 => colorant"#878580",
    600 => colorant"#6F6E69",
    700 => colorant"#575653",
    800 => colorant"#403E3C",
    850 => colorant"#343331",
    900 => colorant"#282726",
    950 => colorant"#1C1B1A",
)

const FLEXOKI_RED = Dict(
    50 => colorant"#FFE1D5",
    100 => colorant"#FFCABB",
    150 => colorant"#FDB2A2",
    200 => colorant"#F89A8A",
    300 => colorant"#E8705F",
    400 => colorant"#D14D41",
    500 => colorant"#C03E35",
    600 => colorant"#AF3029",
    700 => colorant"#942822",
    800 => colorant"#6C201C",
    850 => colorant"#551B18",
    900 => colorant"#3E1715",
    950 => colorant"#261312",
)

const FLEXOKI_ORANGE = Dict(
    50 => colorant"#FFE7CE",
    100 => colorant"#FED3AF",
    150 => colorant"#FCC192",
    200 => colorant"#F9AE77",
    300 => colorant"#EC8B49",
    400 => colorant"#DA702C",
    500 => colorant"#CB6120",
    600 => colorant"#BC5215",
    700 => colorant"#9D4310",
    800 => colorant"#71320D",
    850 => colorant"#59290D",
    900 => colorant"#40200D",
    950 => colorant"#27180E",
)

const FLEXOKI_YELLOW = Dict(
    50 => colorant"#FAEEC6",
    100 => colorant"#F6E2A0",
    150 => colorant"#F1D67E",
    200 => colorant"#ECCB60",
    300 => colorant"#DFB431",
    400 => colorant"#D0A215",
    500 => colorant"#BE9207",
    600 => colorant"#AD8301",
    700 => colorant"#8E6B01",
    800 => colorant"#664D01",
    850 => colorant"#503D02",
    900 => colorant"#3A2D04",
    950 => colorant"#241E08",
)

const FLEXOKI_GREEN = Dict(
    50 => colorant"#EDEECF",
    100 => colorant"#DDE2B2",
    150 => colorant"#CDD597",
    200 => colorant"#BEC97E",
    300 => colorant"#A0AF54",
    400 => colorant"#879A39",
    500 => colorant"#768D21",
    600 => colorant"#66800B",
    700 => colorant"#536907",
    800 => colorant"#3D4C07",
    850 => colorant"#313D07",
    900 => colorant"#252D09",
    950 => colorant"#1A1E0C",
)

const FLEXOKI_CYAN = Dict(
    50 => colorant"#DDF1E4",
    100 => colorant"#BFE8D9",
    150 => colorant"#A2DECE",
    200 => colorant"#87D3C3",
    300 => colorant"#5ABDAC",
    400 => colorant"#3AA99F",
    500 => colorant"#2F968D",
    600 => colorant"#24837B",
    700 => colorant"#1C6C66",
    800 => colorant"#164F4A",
    850 => colorant"#143F3C",
    900 => colorant"#122F2C",
    950 => colorant"#101F1D",
)

const FLEXOKI_BLUE = Dict(
    50 => colorant"#E1ECEB",
    100 => colorant"#C6DDE8",
    150 => colorant"#ABCFE2",
    200 => colorant"#92BFDB",
    300 => colorant"#66A0C8",
    400 => colorant"#4385BE",
    500 => colorant"#3171B2",
    600 => colorant"#205EA6",
    700 => colorant"#1A4F8C",
    800 => colorant"#163B66",
    850 => colorant"#133051",
    900 => colorant"#12253B",
    950 => colorant"#101A24",
)

const FLEXOKI_PURPLE = Dict(
    50 => colorant"#F0EAEC",
    100 => colorant"#E2D9E9",
    150 => colorant"#D3CAE6",
    200 => colorant"#C4B9E0",
    300 => colorant"#A699D0",
    400 => colorant"#8B7EC8",
    500 => colorant"#735EB5",
    600 => colorant"#5E409D",
    700 => colorant"#4F3685",
    800 => colorant"#3C2A62",
    850 => colorant"#31234E",
    900 => colorant"#261C39",
    950 => colorant"#1A1623",
)

const FLEXOKI_MAGENTA = Dict(
    50 => colorant"#FEE4E5",
    100 => colorant"#FCCFDA",
    150 => colorant"#F9B9CF",
    200 => colorant"#F4A4C2",
    300 => colorant"#E47DA8",
    400 => colorant"#CE5D97",
    500 => colorant"#B74583",
    600 => colorant"#A02F6F",
    700 => colorant"#87285E",
    800 => colorant"#641F46",
    850 => colorant"#4F1B39",
    900 => colorant"#39172B",
    950 => colorant"#24131D",
)

const FLEXOKI_ACCENTS_LIGHT = [
    FLEXOKI_RED[600],
    FLEXOKI_ORANGE[600],
    FLEXOKI_YELLOW[600],
    FLEXOKI_GREEN[600],
    FLEXOKI_CYAN[600],
    FLEXOKI_BLUE[600],
    FLEXOKI_PURPLE[600],
    FLEXOKI_MAGENTA[600],
]

const FLEXOKI_ACCENTS_DARK = [
    FLEXOKI_RED[400],
    FLEXOKI_ORANGE[400],
    FLEXOKI_YELLOW[400],
    FLEXOKI_GREEN[400],
    FLEXOKI_CYAN[400],
    FLEXOKI_BLUE[400],
    FLEXOKI_PURPLE[400],
    FLEXOKI_MAGENTA[400],
]

const FLEXOKI_SEQUENTIAL_STOPS = [
    FLEXOKI_BLACK,
    FLEXOKI_RED[900],
    FLEXOKI_RED[600],
    FLEXOKI_ORANGE[400],
    FLEXOKI_YELLOW[400],
    FLEXOKI_YELLOW[50],
    FLEXOKI_PAPER,
]

##
# semantic tokens from https://stephango.com/flexoki#mappings
"""
    flexoki_tokens(mode::Symbol)

Return the Flexoki semantic color tokens as a `NamedTuple`, for `mode`
being `:light` or `:dark`.
"""
function flexoki_tokens(mode::Symbol)
    if mode === :light
        return (;
            bg = FLEXOKI_PAPER,
            bg2 = FLEXOKI_BASE[50],
            ui = FLEXOKI_BASE[100],
            ui2 = FLEXOKI_BASE[150],
            ui3 = FLEXOKI_BASE[200],
            tx = FLEXOKI_BLACK,
            tx2 = FLEXOKI_BASE[600],
            tx3 = FLEXOKI_BASE[300],
            grid = (FLEXOKI_BASE[300], 0.45),
            accents = FLEXOKI_ACCENTS_LIGHT,
            colormap = flexoki_sequential(reverse(FLEXOKI_SEQUENTIAL_STOPS)),
            ambient = RGBf(0.48, 0.46, 0.42),
            light_color = RGBf(0.55, 0.52, 0.46),
        )
    elseif mode === :dark
        return (;
            bg = FLEXOKI_BLACK,
            bg2 = FLEXOKI_BASE[950],
            ui = FLEXOKI_BASE[900],
            ui2 = FLEXOKI_BASE[850],
            ui3 = FLEXOKI_BASE[800],
            tx = FLEXOKI_BASE[200],
            tx2 = FLEXOKI_BASE[500],
            tx3 = FLEXOKI_BASE[700],
            grid = (FLEXOKI_BASE[200], 0.12),
            accents = FLEXOKI_ACCENTS_DARK,
            colormap = flexoki_sequential(FLEXOKI_SEQUENTIAL_STOPS),
            ambient = RGBf(0.42, 0.40, 0.36),
            light_color = RGBf(0.55, 0.52, 0.46),
        )
    else
        throw(ArgumentError("mode must be :light or :dark, got $mode"))
    end
end

"""
    color_flexoki(mode::Symbol = :light)

Return the color-only Flexoki theme for `mode` being `:light` or `:dark`
(default `:light`). Token generation is handled internally via
`flexoki_tokens`. Pass a tokens `NamedTuple` instead to customize.

Flexoki matches the [Flexoki](https://stephango.com/flexoki) desktop/editor
palette. Accents and the sequential colormap are aesthetic, not scientifically
designed perceptual or colorblind-safe colormaps, and are not recommended for
publications that need accurate quantitative color encoding.

These themes compose with style themes; put Flexoki first in `merge`, e.g.
`set_theme!(merge(color_flexoki(), theme_light()))` or
`set_theme!(merge(color_flexoki(:dark), theme_dark()))`.
"""
function color_flexoki(mode::Symbol = :light)
    return color_flexoki(flexoki_tokens(mode))
end

"""
    theme_flexoki(mode::Symbol = :light)

Alias for `color_flexoki(mode)`. Flexoki themes are color-only.
"""
theme_flexoki(mode::Symbol = :light) = color_flexoki(mode)

end
