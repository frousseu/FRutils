\name{newdata}
\alias{newdata}
\title{
Returns a prediction \code{data.frame} for newdata argument in \code{predict}
}
\description{
Function returns a \code{data.frame} with one variable varying and the others fixed at their mean values or their most common level.
}
\usage{
newdata(x, var, fun = mean, n = 50)
}
\arguments{
  \item{x}{
A data.frame. Should add the possibility to extract the \code{model.frame} from a model.
}
  \item{var}{
The name of the variable to build a prediction \code{data.frame} with
}
  \item{fun}{
The function to apply to numerical variables
}
  \item{n}{
The number of values to predict
}
}
\details{
When factors are given, an effort is made to put the same factors in the resulting data.frame. Not sure that the code would work for non-factor categorical variable for now.
}
\value{
A data.frame
}
\references{

}
\author{

}
\note{

}



\seealso{
}
\examples{

}

