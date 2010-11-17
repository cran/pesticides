\name{peach}
\alias{peach}
\docType{data}
\title{
Pesticide residue measurements for peaches
}
\description{
Pesticide residues for peaches from the USDA Pesticide Data Program.
}
\usage{data(peach)}
\format{
  A data frame with 4272 observations on the following 13 variables.
  \describe{
    \item{\code{pesticide}}{The pesticide measured.}
    \item{\code{comp}}{Measured composite residue.}
    \item{\code{ss}}{Measured single item residue.}
    \item{\code{lod}}{Minimum level of detection.}
    \item{\code{items}}{Number of items per composite.}
    \item{\code{state}}{State collected.}
    \item{\code{origin}}{Origin of the produce.}
    \item{\code{year}}{Year.}
    \item{\code{month}}{Month.}
    \item{\code{day}}{Day.}
    \item{\code{site}}{Site.}
    \item{\code{lab}}{Lab that completed measurements.}
    \item{\code{variety}}{Peach variety.}
  }
}
\details{
When the number of items for a composite was listed as zero, it was replaced with the average items per composite from the rest of the data set.
}
\source{
United States Deparatment of Agriculture Pesticide
Data Program.
}
\examples{
data(peach)
these <- peach$pesticide == peach$pesticide[1]
r     <- cor(peach$comp[these], peach$ss[these])
n     <- mean(peach$items[these])
cor2icc(r, n, "not")
}
\keyword{datasets}
\keyword{pesticide}
\keyword{commodity}
\keyword{peach}
\keyword{USDA}
