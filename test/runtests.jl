using MakieThemes
using Test
using Makie
using CSV
using DataFrames
using StatsMakie

@testset "simple" begin
  for i in ggthemr_colorthemes()
        scene = show_ggthemr(i)
        save("img/$i.png", scene)
  end
end

@testset "original" begin
  for dataset ∈ (:www, :drivers, :mtcars, :diamonds)
    @eval const $(dataset) = CSV.read("data/"*$(string(dataset))*".tsv", delim = '\t', allowmissing = :none)
  end

  AbstractPlotting.set_theme!(ggthemr(:fresh))

  p1 = scatterlines(www, Style(:Minute, :Users),
    Group(color = :Measure, marker = :Measure),
    markersize = 6, marker = [1,2]);

  p2 = plot(StatsMakie.KernelDensity.kde, mtcars,
    Style(:mpg), Group(color = :cyl));

  p4 = boxplot(drivers, Style(:Year, :Deaths));

  plot(hbox(vbox(p1, p2), vbox(p3, p4))
end
