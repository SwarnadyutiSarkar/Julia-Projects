using GeoData
using Plots

# Load geospatial data (example: world countries shapefile)
world_countries = GeoData.load("world_countries.shp")  # Replace "world_countries.shp" with your shapefile path

# Plot the world map
plot(world_countries, title="World Countries", linewidth=0.5)
