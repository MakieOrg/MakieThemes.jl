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

    driver_x <- scale_x_discrete(breaks = seq(1969, 1984, 3), label = function(x) paste0("'", substr(x, 3, 4)))
    display_theme <- list(theme(legend.position = 'none'), scale_y_continuous(label = function(x) format(x, big.mark = ",", scientific = FALSE)))

      ggplot(transform(mtcars, cyl = factor(cyl)), aes_string(x = 'mpg', fill = 'cyl', colour = 'cyl')) +
        geom_density(alpha = 0.75) +
        labs(fill = 'Cylinders', colour = 'Cylinders', x = 'MPG', y = 'Density') +
        legend_top(),

      ggplot(transform(diamonds, cut = factor(cut)), aes_string(x = 'price', fill = 'cut')) +
        geom_histogram(binwidth = 850) +
        display_theme +
        xlab('Price (USD)') +
        ylab('Count') +
        scale_x_continuous(label = function(x) paste0(x / 1000, 'k')),

      ggplot(drivers, aes_string(x = 'Year', y = 'Deaths')) +
        geom_boxplot(size = 0.25) +
        ylab('Monthly Deaths') +
        display_theme +
        driver_x

    )

    assign(".Random.seed", old_seed, envir=globalenv())
    do.call(grid.arrange,  display)

  }
