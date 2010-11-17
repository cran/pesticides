\name{cor2icc}
\alias{cor2icc}
\title{
Compute the ICC based on linear correlation
}
\description{
Use the linear correlation to compute the ICC, where the linear correlation is estimated from regressing measurements on items within a group against the group value. The function may also be used to estimate the ICC when the individual is only associated with the group and does not contribute to the group average.
}
\usage{
cor2icc(x, n, type = c("within", "not"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ A numerical value representing a linear correlation. If \code{x} is a matrix or data.frame, it is assumed that the first column represents either the single item measurements or the group measurments and that the opposite measurements be represented in the second column. Under this second scenario, the correlation is computed directly from the data. }
  \item{n}{ The number of single items within each group. }
  \item{type}{ If \code{"within"}, then the measurements from each single item was included in the group measurement. If \code{"not"}, then each single observation is associated with the group but not included in the group measurement. }
}
\value{
A numerical value representing the ICC.
}
\author{
David M Diez
}
\seealso{
\code{\link{cdfDist}}, \code{\link{apple}}, \code{\link{peach}}, \code{\link{pear}}, \code{\link{pepper}}
}
\examples{

#=====> Example 1: apple data <=====#
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

#=====> Example 2: peach data <=====#
data(peach)
pest <- unique(peach$pesticide)
icc1 <- rep(-1, length(pest))
icc2 <- rep(-1, length(pest))
for(i in 1:length(pest)){
	these  <- peach$pesticide == pest[i]
	r      <- cor(peach$comp[these], peach$ss[these])
	n      <- mean(peach$items[these])
	icc1[i] <- cor2icc(r, n, "not")
	icc2[i] <- cor2icc(r, n, "within")
}
names(icc1) <- pest
names(icc2) <- pest
icc1 # correct
icc2 # incorrect based on data collection procedure
}
\keyword{ ICC }
\keyword{ Intracomposite correlation }
\keyword{ decompositing }
\keyword{ pesticide }
