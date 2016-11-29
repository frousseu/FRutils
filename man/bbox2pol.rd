\name{bbox2pol}
\alias{bbox2pol}

\title{
Bounding box 2 SpatialPolygons
}
\description{
Turns a bounding box to a \code{\link{SpatialPolygons}}
}
\usage{
bbox2pol(x,ex=NULL)
}

\arguments{
  \item{x}{If x is missing, the bounding box of the plot region will be used (\code{par("usr")}). If an object inheriting from "Spatial" is given, its bounding box wiil be used. Otherwise, a vector with \code{c(x1, x2, y1, y2)}) has to be given.}
  \item{ex}{A value in the same unit as the spatial object by which to extend the box}

}
\value{
A \code{\link{SpatialPolygons}}
}


