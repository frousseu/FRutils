\name{kde2pol}
\alias{kde2pol}

\title{
Extract contours from an object of class \code{kde}
}
\description{
Extracts contours from an object of class \code{\link{kde}} from package \code{\link{ks}}
}
\usage{
kde2pol(k,proj4string,levels=c(50,95),cut=TRUE)
}

\arguments{
  \item{k}{An object of class \code{\link{kde}} generated with the \code{\link{kde}} function for kernel smoothing.}
  \item{proj4string}{The projection to apply to the resulting polygons. If \code{cut = TRUE}, the \code{k} object has to be in projected coordinates.}
  \item{levels}{A vector of positive integer values for the contours wanted.}
  \item{cut}{When \code{cut = TRUE}, polygons will be cutted with the underlying denser polygons (holes will be built). Otherwise, they will be left as is.}
}

\value{
A \code{\link{SpatialPolygonsDataFrame}} object with ids corresponding to the chosen contours.
}

\author{
Francois Rousseu
}

\seealso{
\code{\link{kde}}
}


