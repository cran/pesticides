\name{apple}
\alias{apple}
\docType{data}
\title{
Pesticide residue measurements for apples
}
\description{
An abbreviated data set of \code{\link{appleAll}} data set.
This data was collected by the USDA Pesticide Data Program and used to estimate the ICC for pesticides on apples.
}
\usage{data(apple)}
\format{
  A data frame with 1134 observations on the following 6 variables.
  \describe{
    \item{\code{pesticide}}{The pesticide measured.}
    \item{\code{comp}}{Measured composite residue.}
    \item{\code{ss}}{Measured single item residue.}
    \item{\code{lod}}{Minimum level of detection.}
    \item{\code{items}}{Number of items per composite.}
    \item{\code{sampID}}{Sample ID.}
  }
}
\source{
United States Deparatment of Agriculture Pesticide
Data Program.
}
\examples{
data(apple)
these <- apple$pesticide == apple$pesticide[1]
r     <- cor(apple$comp[these], apple$ss[these])
cor2icc(r, 10,"within")
}
\keyword{datasets}
\keyword{pesticide}
\keyword{commodity}
\keyword{apple}
\keyword{USDA}
