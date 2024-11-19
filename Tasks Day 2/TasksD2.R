# Day 2
## Tasks

# 2. Create three S3 class objects
obj1 <- list(x=1)
obj2 <- list(x=1,y=2)
obj3 <- list(x=1,y=2,z=3)

class(obj1) <- "Point1D"
class(obj2) <- "Point2D"
class(obj3) <- "Point3D"

# 3. Create generic "point" method
point <- function(x, ...) {
  UseMethod("point") 
}

# 4. Create regular methods
point.Point1D <- function(point1, point2){
  point1$x - point2$x
}

point.Point2D <- function(point1, point2){
  sqrt((point1$x - point2$x)^2 + (point1$y - point2$y)^2)
}

point.Point3D <- function(point1, point2){
  sqrt((point1$x - point2$x)^2 + (point1$y - point2$y)^2 + (point1$z - point2$z)^2)
}

# 5. Create three lists with 10 empty elements
my_1D <- vector("list", 10)
my_2D <- vector("list", 10)
my_3D <- vector("list", 10)

# 6. Populate the three lists
for (a in 1:length(my_1D)) {
  my_1D[[a]] <- list(x = sample(1:10, 1))
  class(my_1D[[a]]) <- "Point1D"
}

for (a in 1:length(my_2D)) {
  my_2D[[a]] <- list(x = sample(1:10, 1), y = sample(1:10,1))
  class(my_2D[[a]]) <- "Point2D"
}

for (a in 1:length(my_3D)) {
  my_3D[[a]] <- list(x = sample(1:10, 1), y = sample(1:10,1), z = sample(1:10,1))
  class(my_3D[[a]]) <- "Point3D"
}

# 7. Create a function called point_distance + 8. Create loop in function
point_distance <- function (origin, end_points) {
  distance <- c()
  for (a in 1:length(end_points)) {
    distance <- c(distance, point(origin, (end_points[[a]])))
  }
  return(distance)
}



point_distance <- function (origin, end_points) {
  distance <- c()
  for (a in 1:length(end_points)) {
    distance <- c(distance, point(origin,(end_points[[a]])))
  }
  return(distance)
}



# 9. Make three function call to "point_distance" providing a 0 origin object
origin1D <- list(x = 0)
class(origin1D) <- "Point1D"

origin2D <- list(x = 0, y = 0)
class(origin2D) <- "Point2D"

origin3D <- list(x = 0, y = 0, z = 0)
class(origin3D) <- "Point3D"

final1 <- point_distance(origin1D, my_1D)
final2 <- point_distance(origin2D, my_2D)
final3 <- point_distance(origin3D, my_3D)

