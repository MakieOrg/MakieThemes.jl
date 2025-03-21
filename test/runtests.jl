using MakieThemes
using Test
using Makie, CairoMakie
using CSV
using DataFrames
using AlgebraOfGraphics



@testset "simple" begin
  mkpath(joinpath(dirname(@__DIR__), "img", "demofigure"))
  mkpath(joinpath(dirname(@__DIR__), "img", "demoscatter"))

  fig = MakieThemes.demofigure()
  save(joinpath(dirname(@__DIR__), "img", "demofigure", "default.png"), fig; px_per_unit = 2)

  fig = MakieThemes.demoscatter()
  save(joinpath(dirname(@__DIR__), "img", "demoscatter", "default.png"), fig; px_per_unit = 2)

  old_theme = deepcopy(Makie.current_default_theme())


  for i in ggthemr_colorthemes()
    @test_nowarn begin
        fig = MakieThemes.demofigure(theme_ggthemr(i))
        save(joinpath(dirname(@__DIR__), "img", "demofigure", "$i.png"), fig; px_per_unit = 2)

        fig = MakieThemes.demoscatter(theme_ggthemr(i))
        save(joinpath(dirname(@__DIR__), "img", "demoscatter", "$i.png"), fig; px_per_unit = 2)

        Makie.set_theme!(old_theme)
    end
  end
  fig = MakieThemes.demofigure(theme_bbc())
  save(joinpath(dirname(@__DIR__), "img", "demofigure", "bbc.png"), fig; px_per_unit = 2)


  fig = MakieThemes.demoscatter(theme_bbc())
  save(joinpath(dirname(@__DIR__), "img", "demoscatter", "bbc.png"), fig; px_per_unit = 2)

  fig = MakieThemes.demofigure(color_gruvbox_light())
  save(joinpath(dirname(@__DIR__), "img", "demoscatter", "gruvbox-light.png"), fig; px_per_unit = 2)

  fig = MakieThemes.demofigure(color_gruvbox_dark())
  save(joinpath(dirname(@__DIR__), "img", "demoscatter", "gruvbox-dark.png"), fig; px_per_unit = 2)

  fig = MakieThemes.demoscatter(color_gruvbox_light())
  save(joinpath(dirname(@__DIR__), "img", "demoscatter", "gruvbox-light.png"), fig; px_per_unit = 2)

  fig = MakieThemes.demoscatter(color_gruvbox_dark())
  save(joinpath(dirname(@__DIR__), "img", "demoscatter", "gruvbox-dark.png"), fig; px_per_unit = 2)

  Makie.set_theme!(old_theme)
end

@testset "GGthemr" begin
  @testset "original" begin
    for dataset ∈ (:www, :drivers, :mtcars, :diamonds)
      @eval $(dataset) = CSV.read(dirname(pathof(MakieThemes))*"/../data/"*$(string(dataset))*".tsv", delim = '\t', DataFrame)
    end


    with_theme(ggthemr(:fresh)) do

      fig = Figure()
      
      www_grid = draw!(fig[1, 1], data(www) * mapping(:Minute, :Users, color = :Measure) * (visual(Lines) + mapping(marker = :Measure) * visual(Scatter)))
      legend!(fig[1, 1, Top()], www_grid; orientation = :horizontal, titleposition = :left)


      mtcars_grid = draw!(fig[1, 2], data(mtcars) * mapping(:mpg, color = :cyl => nonnumeric) * AlgebraOfGraphics.density())

      legend!(fig[1, 2, Top()], mtcars_grid; orientation = :horizontal, titleposition = :left)

      diamonds_grid = draw!(fig[2, 1],
          data(diamonds) * mapping(:price, color = :cut, stack = :cut) * AlgebraOfGraphics.histogram();
          axis = (xtickformat = x -> string.(round.(Int, x)),)
        )

      drivers_grid = draw!(fig[2, 2], data(drivers) * mapping(:Year, :Deaths) * visual(BoxPlot))

      @test_nowarn save(joinpath(dirname(@__DIR__), "img", "ggthemr_full_fresh.png"), fig; px_per_unit = 2)

    end
  end
end
