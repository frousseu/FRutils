\name{colo.scale}
\alias{colo.scale}

\title{
Interpolate colors with values or classify values by colors
}
\description{
This function is used to obtain a color scale from a set of values
}
\usage{
colo.scale(x,cols=c("white","yellow","tomato3","darkred"),
	center=TRUE,breaks=NULL)
}

\arguments{
  \item{x}{A numeric vector}
  \item{cols}{A vector of colors}
  \item{center}{Whether to center the middle color value at 0}
  \item{breaks}{A numeric vector. If breaks are given, value will be classified into each color provided the number of breaks equals the number of colors given. In other words, \code{length(breaks) == length(cols) + 1}}
}
\details{
This function is a simple wrapper for the \link{\code{colorRamp}} function in the \link{\code{grDevices}} package.
}
\value{
A color vector of the same length as \code{x}
}

\seealso{
\link{\code{colorRamp}}, \link{\code{colorRampPalette}}
}
\examples{

}


