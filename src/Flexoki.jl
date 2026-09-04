# Flexoki color themes for Makie.
# Flexoki palette copyright (c) 2023 Steph Ango, MIT license:
# https://github.com/kepano/flexoki — see LICENSE-Flexoki.md.
# Light accents use the 600 ramp; dark accents use the 400 ramp.
#
# These themes set colors (including spine, tick, grid, and frame colors) but
# no structural chrome, so they compose with any Makie style theme. In Makie's
# merge the first theme wins, so put Flexoki first, e.g.
#   set_theme!(merge(color_flexoki_light(), theme_light()))
#   set_theme!(merge(color_flexoki_dark(), theme_dark()))
#
# Note: Flexoki is designed to match Flexoki desktop/editor themes. The
# sequential colormap and accent cycle are aesthetic, not scientifically
# designed perceptual / colorblind-safe colormaps, and are not recommended
# for publications that need accurate quantitative color encoding.

module Flexoki

using Makie, Colors

export color_flexoki_light, color_flexoki_dark

rgb(hex::AbstractString) = parse(RGBf, hex)

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
    color_flexoki(tokens)

Build a color-only Makie theme from Flexoki semantic tokens. Sets
background, text, line, palette, colormap, and 3D lighting colors, plus the
color of axis borders/spines, ticks, grids, and legend/colorbar frames. No
structural chrome (visibility, widths, paddings, tick sizes, etc.) is
applied, so the result composes with any style theme.
"""
function color_flexoki(tokens)
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
const FLEXOKI_BLACK = rgb("#100F0F")
const FLEXOKI_PAPER = rgb("#FFFCF0")

const FLEXOKI_BASE = Dict(
    50 => rgb("#F2F0E5"),
    100 => rgb("#E6E4D9"),
    150 => rgb("#DAD8CE"),
    200 => rgb("#CECDC3"),
    300 => rgb("#B7B5AC"),
    400 => rgb("#9F9D96"),
    500 => rgb("#878580"),
    600 => rgb("#6F6E69"),
    700 => rgb("#575653"),
    800 => rgb("#403E3C"),
    850 => rgb("#343331"),
    900 => rgb("#282726"),
    950 => rgb("#1C1B1A"),
)

const FLEXOKI_RED = Dict(
    50 => rgb("#FFE1D5"),
    100 => rgb("#FFCABB"),
    150 => rgb("#FDB2A2"),
    200 => rgb("#F89A8A"),
    300 => rgb("#E8705F"),
    400 => rgb("#D14D41"),
    500 => rgb("#C03E35"),
    600 => rgb("#AF3029"),
    700 => rgb("#942822"),
    800 => rgb("#6C201C"),
    850 => rgb("#551B18"),
    900 => rgb("#3E1715"),
    950 => rgb("#261312"),
)

const FLEXOKI_ORANGE = Dict(
    50 => rgb("#FFE7CE"),
    100 => rgb("#FED3AF"),
    150 => rgb("#FCC192"),
    200 => rgb("#F9AE77"),
    300 => rgb("#EC8B49"),
    400 => rgb("#DA702C"),
    500 => rgb("#CB6120"),
    600 => rgb("#BC5215"),
    700 => rgb("#9D4310"),
    800 => rgb("#71320D"),
    850 => rgb("#59290D"),
    900 => rgb("#40200D"),
    950 => rgb("#27180E"),
)

const FLEXOKI_YELLOW = Dict(
    50 => rgb("#FAEEC6"),
    100 => rgb("#F6E2A0"),
    150 => rgb("#F1D67E"),
    200 => rgb("#ECCB60"),
    300 => rgb("#DFB431"),
    400 => rgb("#D0A215"),
    500 => rgb("#BE9207"),
    600 => rgb("#AD8301"),
    700 => rgb("#8E6B01"),
    800 => rgb("#664D01"),
    850 => rgb("#503D02"),
    900 => rgb("#3A2D04"),
    950 => rgb("#241E08"),
)

const FLEXOKI_GREEN = Dict(
    50 => rgb("#EDEECF"),
    100 => rgb("#DDE2B2"),
    150 => rgb("#CDD597"),
    200 => rgb("#BEC97E"),
    300 => rgb("#A0AF54"),
    400 => rgb("#879A39"),
    500 => rgb("#768D21"),
    600 => rgb("#66800B"),
    700 => rgb("#536907"),
    800 => rgb("#3D4C07"),
    850 => rgb("#313D07"),
    900 => rgb("#252D09"),
    950 => rgb("#1A1E0C"),
)

const FLEXOKI_CYAN = Dict(
    50 => rgb("#DDF1E4"),
    100 => rgb("#BFE8D9"),
    150 => rgb("#A2DECE"),
    200 => rgb("#87D3C3"),
    300 => rgb("#5ABDAC"),
    400 => rgb("#3AA99F"),
    500 => rgb("#2F968D"),
    600 => rgb("#24837B"),
    700 => rgb("#1C6C66"),
    800 => rgb("#164F4A"),
    850 => rgb("#143F3C"),
    900 => rgb("#122F2C"),
    950 => rgb("#101F1D"),
)

const FLEXOKI_BLUE = Dict(
    50 => rgb("#E1ECEB"),
    100 => rgb("#C6DDE8"),
    150 => rgb("#ABCFE2"),
    200 => rgb("#92BFDB"),
    300 => rgb("#66A0C8"),
    400 => rgb("#4385BE"),
    500 => rgb("#3171B2"),
    600 => rgb("#205EA6"),
    700 => rgb("#1A4F8C"),
    800 => rgb("#163B66"),
    850 => rgb("#133051"),
    900 => rgb("#12253B"),
    950 => rgb("#101A24"),
)

const FLEXOKI_PURPLE = Dict(
    50 => rgb("#F0EAEC"),
    100 => rgb("#E2D9E9"),
    150 => rgb("#D3CAE6"),
    200 => rgb("#C4B9E0"),
    300 => rgb("#A699D0"),
    400 => rgb("#8B7EC8"),
    500 => rgb("#735EB5"),
    600 => rgb("#5E409D"),
    700 => rgb("#4F3685"),
    800 => rgb("#3C2A62"),
    850 => rgb("#31234E"),
    900 => rgb("#261C39"),
    950 => rgb("#1A1623"),
)

const FLEXOKI_MAGENTA = Dict(
    50 => rgb("#FEE4E5"),
    100 => rgb("#FCCFDA"),
    150 => rgb("#F9B9CF"),
    200 => rgb("#F4A4C2"),
    300 => rgb("#E47DA8"),
    400 => rgb("#CE5D97"),
    500 => rgb("#B74583"),
    600 => rgb("#A02F6F"),
    700 => rgb("#87285E"),
    800 => rgb("#641F46"),
    850 => rgb("#4F1B39"),
    900 => rgb("#39172B"),
    950 => rgb("#24131D"),
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
    color_flexoki_light()

Return the color-only Flexoki light theme.

Flexoki matches the [Flexoki](https://stephango.com/flexoki) desktop/editor
palette. Accents and the sequential colormap are aesthetic, not scientifically
designed perceptual or colorblind-safe colormaps, and are not recommended for
publications that need accurate quantitative color encoding.
"""
function color_flexoki_light()
    return color_flexoki(flexoki_tokens(:light))
end

"""
    color_flexoki_dark()

Return the color-only Flexoki dark theme.

See [`color_flexoki_light`](@ref) for intended-use notes.
"""
function color_flexoki_dark()
    return color_flexoki(flexoki_tokens(:dark))
end

end
