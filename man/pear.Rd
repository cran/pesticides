\name{pear}
\alias{pear}
\docType{data}
\title{
Pesticide residue measurements for pears
}
\description{
Pesticide residues for pears from the USDA Pesticide Data Program.
}
\usage{data(pear)}
\format{
  A data frame with 1962 observations on the following 13 variables.
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
The number of items per composite was unavailable for this data set and was inputed as 10.
}
\source{
United States Deparatment of Agriculture Pesticide
Data Program.
}
\examples{
data(pear)
these <- pear$pesticide == pear$pesticide[1]
r     <- cor(pear$comp[these], pear$ss[these])
cor2icc(r, 10, "not")
}
\keyword{datasets}
\keyword{pesticide}
\keyword{commodity}
\keyword{pear}
\keyword{USDA}
