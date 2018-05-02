setwd("C:/Users/surya/Desktop/DecemberBreak")

#install.packages("ggmap")
library(ggmap)
corvallis <- c(lon = -122.1430, lat = 37.4419)

# Get map at zoom level 5: map_5
map_5 <- get_map(corvallis, zoom = 5, scale = 1)

# Plot map at zoom level 5
ggmap(map_5)

# Get map at zoom level 13: corvallis_map
corvallis_map <- get_map(corvallis, zoom = 13, scale = 1)

# Plot map at zoom level 13
ggmap(corvallis_map)

sales = readRDS("01_corv_sales.rds")
head(sales)
View(sales)
write.csv(x = sales, file = "sales.csv")


ward_sales = readRDS("01_corv_wards.rds")
head(ward_sales)
View(ward_sales)
write.csv(x = ward_sales, file = "ward_sales.csv")

preds = readRDS("01_corv_predicted_grid.rds")
head(preds)
write.csv(x = preds, file = "preds.csv")

# Look at head() of sales
head(sales)

# Swap out call to ggplot() with call to ggmap()
ggmap(corvallis_map) +
  geom_point(aes(lon, lat), data = sales)

#------------------

# Map color to year_built
ggmap(corvallis_map) +
  geom_point(aes(lon, lat, color = year_built), data = sales)

# Map size to bedrooms
ggmap(corvallis_map) +
  geom_point(aes(lon, lat, size = bedrooms), data = sales)

# Map color to price / finished_squarefeet
ggmap(corvallis_map) +
  geom_point(aes(lon, lat, color = price / finished_squarefeet), 
             data = sales)

#-----------------

corvallis <- c(lon = -123.2620, lat = 44.5646)

# Add a maptype argument to get a satellite map
corvallis_map_sat <- get_map(corvallis, zoom = 13, 
                             maptype = "satellite")

# Edit to get display satellite map
ggmap(corvallis_map_sat) +
  geom_point(aes(lon, lat, color = year_built), data = sales)

# Add source and maptype to get toner map from Stamen Maps
corvallis_map_bw <- get_map(corvallis, zoom = 5, 
                            source = "stamen", 
                            maptype = "toner")

# Edit to display toner map
ggmap(corvallis_map_bw) +
  geom_point(aes(lon, lat, color = year_built), data = sales)

# Add source and maptype to get toner map from Stamen Maps
corvallis_map_bw <- get_map(corvallis, zoom = 13, 
                            source = "stamen", 
                            maptype = "toner")

# Edit to display toner map
ggmap(corvallis_map_bw) +
  geom_point(aes(lon, lat, color = year_built), data = sales)

#------------------

# Use base_layer argument to ggmap() to specify data and x, y mappings
ggmap(corvallis_map_bw, base_layer = ggplot(sales, aes(lon, lat))) +
  geom_point(aes(color = year_built))

# Use base_layer argument to ggmap() and add facet_wrap()
ggmap(corvallis_map_bw, base_layer = ggplot(sales, aes(lon, lat))) +
  geom_point(aes(color = class)) +
  facet_wrap(~ class)

#---------------

# Plot house sales using qmplot()
qmplot(lon, lat, data = sales, geom = "point", color = bedrooms) +
  facet_wrap(~ month)

#----------------

# Add a point layer with color mapped to ward
ggplot(ward_sales, aes(lon, lat)) +
  geom_point(aes(color = ward))

# Add a point layer with color mapped to group
ggplot(ward_sales, aes(lon, lat)) +
  geom_point(aes(color = group))

# Add a path layer with group mapped to group
ggplot(ward_sales, aes(lon, lat)) +
  geom_path(aes(group = group))

# Add a polygon layer with fill mapped to ward, and group to group
ggplot(ward_sales, aes(lon, lat)) +
  geom_polygon(aes(group = group, fill = ward))

#-----------------------------

# Fix the polygon cropping
ggmap(corvallis_map_bw, 
      base_layer = ggplot(ward_sales, aes(lon, lat)),
      extent = "normal", maprange = FALSE) +
  geom_polygon(aes(group = group, fill = ward))

# Repeat, but map fill to num_sales
ggmap(corvallis_map_bw, 
      base_layer = ggplot(ward_sales, aes(lon, lat)),
      extent = "normal", maprange = FALSE) +
  geom_polygon(aes(group = group, fill = num_sales))

# Repeat again, but map fill to avg_price
ggmap(corvallis_map_bw, 
      base_layer = ggplot(ward_sales, aes(lon, lat)),
      extent = "normal", maprange = FALSE) +
  geom_polygon(aes(group = group, fill = avg_price), alpha = 0.8)

#---------------------------------

# Add a geom_point() layer
ggplot(preds, aes(lon, lat)) +
  geom_point()

# Add a tile layer with fill mapped to predicted_price
ggplot(preds, aes(lon, lat)) +
  geom_tile(aes(fill = predicted_price))

# Use ggmap() instead of ggplot()
ggmap(corvallis_map_bw) +
  geom_tile(aes(lon, lat, fill = predicted_price), 
            data = preds, alpha = 0.8)

#SP package

library(sp)

# Print countries_sp
countries_sp

# Call summary() on countries_sp
summary(countries_sp)

# Call plot() on countries_sp
plot(countries_sp)

#----------------------

flights = read.csv("flights.csv")
flights

us_map = 37.0902° N, 95.7129° W
library(ggmap)
us <- c(lon = -95.7129, lat = 37.0902)

# Get map at zoom level 5: map_5
map_2 <- get_map(us, zoom = 4, scale = 1)

# Plot map at zoom level 5
ggmap(map_2)

# Get map at zoom level 13: corvallis_map
us_map <- get_map(us, zoom = 4, scale = 1)

# Plot map at zoom level 13
ggmap(us_map)

ggmap(us_map) +
  geom_point(aes(Longitude, Latitude, color = Path, size = 25), data = flights)

# Add a point layer with color mapped to ward
ggplot(flights, aes(Longitude, Latitude)) +
  geom_point(aes(color = ward))

# Add a point layer with color mapped to group
ggplot(ward_sales, aes(lon, lat)) +
  geom_point(aes(color = group))

ggplot(flights, aes(Longitude, Latitude)) +
  geom_path(aes(group = Path.ID))

# Add a maptype argument to get a satellite map
us_map_sat <- get_map(us, zoom = 4, 
                             maptype = "satellite")

# Edit to get display satellite map
ggmap(us_map_sat) +
  geom_point(aes(Longitude, Latitude, color = flights$ï..Location, size = 50), data = flights)

# Add source and maptype to get toner map from Stamen Maps
us_map_bw <- get_map(us, zoom = 4, 
                            source = "stamen", 
                            maptype = "toner")
# Edit to display toner map
ggmap(us_map_bw) +
  geom_point(aes(Longitude, Latitude, color = Path, size = 50), data = flights)

# Add source and maptype to get toner map from Stamen Maps
us_map_bw <- get_map(us, zoom = 4, 
                            source = "stamen", 
                            maptype = "toner")

# Edit to display toner map
ggmap(us_map_bw) +
  geom_path(aes(Longitude, Latitude, color = Path.ID), data = flights) +
  geom_point(aes(Longitude, Latitude, color = flights$ï..Location, size = 50), data = flights)

ggmap(us_map_sat) +
  geom_path(aes(Longitude, Latitude, color = Path.ID), data = flights) +
  geom_point(aes(Longitude, Latitude, color = flights$ï..Location, size = 50), data = flights)
