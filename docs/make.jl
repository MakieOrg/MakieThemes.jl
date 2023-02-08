using MakieThemes
using Makie, CairoMakie, AlgebraOfGraphics, CSV
using Documenter

DocMeta.setdocmeta!(MakieThemes, :DocTestSetup, :(using MakieThemes, Makie, CairoMakie); recursive=true)

# generate the GGThemr page
open(joinpath(@__DIR__, "src", "themes", "ggthemr.jl"), "w") do io
    println(io, "# GGThemr")

    println(io, """
    ```@setup ggthemr
    using MakieThemes, CairoMakie, Makie
    CairoMakie.activate!(type="svg")
    ```
    """)

    for colortheme in MakieThemes.ggthemr_colorthemes()
        println(io, "## ggthemr(:$colortheme)")
        println(io, """
        ```@example ggthemr
        MakieThemes.demofigure(ggthemr(:$colortheme))
        ```
        ```@example ggthemr
        MakieThemes.demoscatter(ggthemr(:$colortheme))
        ```
        """)
        println(io, "\n\n")
    end
end

makedocs(;
    modules=[MakieThemes],
    authors="Michael Krabbe Borregaard <mkborregaard@snm.ku.dk>, Anshul Singhvi <anshul.singhvi@columbia.edu>, and contributors",
    repo="https://github.com/JuliaPlots/MakieThemes.jl/blob/{commit}{path}#{line}",
    sitename="MakieThemes.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://juliaplots.github.io/MakieThemes.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "BBC" => "themes/bbc.md",
        "GGThemr" => "themes/ggthemr.md",
    ],
)

deploydocs(;
    repo="github.com/JuliaPlots/MakieThemes.jl",
    devbranch="master",
)

# clean up
rm(joinpath(@__DIR__, "src", "themes", "ggthemr.jl"))