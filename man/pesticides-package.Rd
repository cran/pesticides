\name{pesticides-package}
\alias{pesticides-package}
\alias{pesticides}
\docType{package}
\title{
Analysis of single serving and composite pesticide residue 
}
\description{
Single item and composite pesticide residue measurements
of fifteen commodity-pesticide combinations plus analytical
tools.
}
\details{
\tabular{ll}{
Package: \tab pesticides\cr
Type: \tab Package\cr
Version: \tab 0.1\cr
Date: \tab 2010-11-17\cr
License: \tab GPL-3\cr
LazyLoad: \tab yes\cr
}
}
\author{
David M Diez

Maintainer: David M Diez <david.m.diez@gmail.com>
}
\references{
United States Department of Agriculture Pesticide 
Data Program (www.ams.usda.gov/science/pdp/).

United States Environmental Protection Agency 
(http://www.epa.gov/).

National Food Administration of Sweden 
(http://www.slv.se/en-gb/) 
(http://www.slv.se/upload/dokument/rapporter/kemiska/bekampningsmedel/slvrapp12_2000_pesticide_residues.pdf).
}
\keyword{ package }
\keyword{ pesticides }
\keyword{ commodity }
\keyword{ exposure }
\keyword{ risk assessment }
\seealso{
\code{\link{apple}}, \code{\link{peach}}, \code{\link{pear}}, \code{\link{pepper}}, \code{\link{cor2icc}}, \code{\link{cdfDist}}
}
\examples{

#=====> cor2icc <=====#
data(apple)
pest <- unique(apple$pesticide)
icc  <- rep(-1, length(pest))
for(i in 1:length(pest)){
  these  <- apple$pesticide == pest[i]
  r      <- cor(apple$comp[these], apple$ss[these])
  icc[i] <- cor2icc(r, 10,"within")
}
names(icc) <- pest
icc


#=====> cdfDist <=====#
par(mfrow=1:2)

F1   <- seq(0.001, 0.999, 0.001)[-sample(999, 300)]
x1   <- exp(quantile(rnorm(10000, 0.5, sd=0.5), F1))
F2   <- seq(0.001, 0.999, 0.001)[-sample(999, 300)]
x2   <- qchisq(F2, mean(x1))
hold <- cdfDist(x1, F1, x2, F2)
plot(hold)
summary(hold)

F1   <- seq(0.001, 0.999, 0.001)[-sample(999, 300)]
x1   <- exp(quantile(rnorm(10000, 0.5, sd=0.5), F1))
F2   <- seq(0.001, 0.999, 0.001)[-sample(999, 300)]
x2   <- qchisq(F2, mean(x1)+1)
hold <- cdfDist(x1, F1, x2, F2)
plot(hold)
summary(hold)

}
