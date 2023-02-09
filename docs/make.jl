using MakieThemes
using Makie, CairoMakie, AlgebraOfGraphics, CSV
using Documenter

DocMeta.setdocmeta!(MakieThemes, :DocTestSetup, :(using MakieThemes, Makie, CairoMakie); recursive=true)

using Pkg
Pkg.test("MakieThemes")

mkpath(joinpath(@__DIR__, "src", "assets"))
cp(joinpath(dirname(@__DIR__), "img"), joinpath(@__DIR__, "src", "assets", "img"))

# generate the GGThemr page
open(joinpath(dirname(dirname(pathof(MakieThemes))), "docs", "src", "themes", "ggthemr.md"), "w") do io
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
        ```julia
        MakieThemes.demofigure(ggthemr(:$colortheme))
        ```
        ```@raw html
        <img src="../assets/img/demofigure/$colortheme.png" alt="ggthemr colortheme :$colortheme" width="900"/>
        ```
        ```julia
        MakieThemes.demoscatter(ggthemr(:$colortheme))
        ```
        ```@raw html
        <img src="../assets/img/demoscatter/$colortheme.png" alt="ggthemr colortheme :$colortheme" width="900"/>
        ```
        """)
        println(io, "\n\n")
    end
end

makedocs(;
    modules=[MakieThemes],
    authors="Michael Krabbe Borregaard <mkborregaard@snm.ku.dk>, Anshul Singhvi <anshul.singhvi@columbia.edu>, and contributors",
    repo="https://github.com/MakieOrg/MakieThemes.jl/blob/{commit}{path}#{line}",
    sitename="MakieThemes.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://makieorg.github.io/MakieThemes.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "BBC" => "themes/bbc.md",
        "GGThemr" => "themes/ggthemr.md",
        "API" => "api.md"
    ],
)

deploydocs(;
    repo="github.com/MakieOrg/MakieThemes.jl",
    devbranch="master",
    push_preview = true,
)

# clean up
# rm(joinpath(@__DIR__, "src", "themes", "ggthemr.jl"))