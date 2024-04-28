using LightGraphs
using GraphPlot

# Create a simple undirected graph
g = SimpleGraph(5)
add_edge!(g, 1, 2)
add_edge!(g, 1, 3)
add_edge!(g, 2, 4)
add_edge!(g, 3, 5)

# Visualize the graph
gplot(g, layout=spectral_layout, nodefillc=:lightblue, nodestrokec=:gray, node_label=1:nv(g))
