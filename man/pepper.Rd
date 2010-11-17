\name{pepper}
\alias{pepper}
\docType{data}
\title{
Pesticide residue data for sweet peppers
}
\description{
Pesticide residues for sweet peppers from the National Food Administration of Sweden.
}
\usage{data(pepper)}
\format{
  A data frame with 166 observations on the following 6 variables.
  \describe{
    \item{\code{gp}}{Group or composite number.}
    \item{\code{color}}{The color of the pepper.}
    \item{\code{comp}}{Corresponding composite residue measurement.}
    \item{\code{ss}}{Single item residue measurement.}
    \item{\code{lod}}{Minimum level of detection.}
    \item{\code{items}}{Number of items in the corresponding composite.}
  }
}
\details{
Residues were measured for all individual peppers in this data set. This data is especially unique -- and ideal -- in that all single items within the composites were measured.
}
\source{
National Food Administration of Sweden. A description of the data is in
<http://www.slv.se/upload/dokument/rapporter/kemiska/bekampningsmedel/slvrapp12_2000_pesticide_residues.pdf>.
}
\examples{
data(pepper)
r  <- cor(pepper$comp, pepper$ss)
g  <- lm(comp ~ ss, pepper)
n  <- mean(pepper$items)
cor2icc(r, n, "within")
plot(pepper$ss, pepper$comp)
abline(g)
}
\keyword{datasets}
\keyword{pesticide}
\keyword{commodity}
\keyword{pepper}
