\name{hexgrid}
\alias{hexgrid}

\title{
Build an hexagonal grid
}
\description{
Builds an hexagonal grid over a spatial object using a convex hull.
}
\usage{
hexgrid(x,width=NULL,n=NULL,buffer=NULL,convex=TRUE,seed=1)
}

\arguments{
  \item{x}{A spatial object, ideally projected.}
  \item{width}{Approximate width of hexagonal cell}
  \item{n}{Number of divisions to approximately split the convex hull along the x direction.}
  \item{buffer}{Width of a buffer around the convex hull of \code{x} to extend the grid}
  \item{convex}{Keep cells over convex hull or over \code{x} objects?}
  \item{seed}{A seed to obtain the same grid since it is based on \code{\link{spsample}}.}
}
\details{
 When \code{x} is not projected, it is projected using laea and centered on mean x and y values and given back with the initial CRS. Better to input projected data anyway for displaying...
}
\value{
 A \code{\link{SpatialPolygonsDataFrame}} hexagonal grid overlapping \code{x}.
}

\author{
Francois Rousseu
}





