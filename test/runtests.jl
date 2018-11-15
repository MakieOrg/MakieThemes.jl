using MakieThemes
using Test
using Makie

for i in ggthemr_colorthemes()
      scene = show_ggthemr(i)
      save("img/$i.png", scene)
end
