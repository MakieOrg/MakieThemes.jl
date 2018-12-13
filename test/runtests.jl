using MakieThemes
using Test
using Makie
using CSV
using DataFrames
using StatsMakie


@testset "simple" begin
  for i in ggthemr_colorthemes()
        scene = show_ggthemr(i)
  end
end


@testset "original" begin
  for dataset ∈ (:www, :drivers, :mtcars, :diamonds)
    path = joinpath(@__DIR__, "..", "data", string(dataset, ".tsv"))
    @eval $(dataset) = CSV.read($path, delim = '\t', allowmissing = :none)
  end

  AbstractPlotting.set_theme!(ggthemr(:fresh))

  p1 = scatterlines(Data(www), :Minute, :Users,
    Group(color = :Measure, marker = :Measure),
    markersize = 6, marker = [:rect, :circle]);

  p2 = plot(density, Data(mtcars),
    :mpg, Group(color = :cyl));

  p3 = plot(Position.stack, histogram, Data(diamonds),
    :price, Group(color = :cut));

  p4 = boxplot(Data(drivers), :Year, :Deaths);

  vbox(hbox(p1, p2), hbox(p3, p4))
end
