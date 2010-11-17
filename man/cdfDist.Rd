\name{cdfDist}
\alias{cdfDist}
\alias{print.cdfDist}
\alias{summary.cdfDist}
\alias{plot.cdfDist}
\title{
Distance measure for cumulative distribution functions
}
\description{
This distance measure is useful in assessing the dissimilarity in two cumulative distribution functions, if differences in the right tail are of particular interest.
}
\usage{
cdfDist(x1, F1, x2, F2)
}
\arguments{
  \item{x1}{ A vector of numerical values. }
  \item{F1}{ A vector of numerical values, where the i-th elementh of \code{F1} is the CDF at value \code{x1[i]}. }
  \item{x2}{ A vector of numerical values. }
  \item{F2}{ A vector of numerical values, where the i-th elementh of \code{F2} is the CDF at value \code{x2[i]}. }
}
\details{
This function first computes a pointwise distance at each value x as
\deqn{
D(x) = (F1(x) - F2(x))^2 / (1 - min(F1(x), F2(x)))
}
The measure is equal to the integral of this distance over the intersection of the provided quantiles of the two CDFs, a region \eqn{(m1, m2)}. Finally, the measure is standardized by the distane of this range:
\deqn{
\mu(F1, F2) = Int_m1^m2 D(x) dx / (m2-m1)
}
This measure was designed to penalize heavily if the right tails of the distributions were very dissimilar. A poor match in the lower tail results in only a slight increase of the measure.

The functions \code{print}, \code{plot}, and \code{summary} may be applied to the output of \code{cdfDist}.
}
\value{
The output is a list of class \code{"cdfDist"}:
  \item{x }{The values at which the pointwise distance was computed and then integrated over.}
  \item{F1 }{The first CDF for each value of \code{x}.}
  \item{F2 }{The second CDF for each value of \code{x}.}
  \item{meas }{A vector representing the integral of the pointwise distance from \code{x[1]} up to each value of \code{x}. Plotting this measure with \code{x} makes it easy to see where the distance grew the fastest between the CDFs.}
  \item{cdfDist }{The distance between the CDFs.}
}
\author{
David M Diez
}
\seealso{
\code{\link{cor2icc}}, \code{\link{apple}}, \code{\link{peach}}, \code{\link{pear}}, \code{\link{pepper}}
}
\examples{

par(mfrow=c(2,2))

#=====> Example 1 <=====#
F1   <- seq(0.001, 0.999, 0.001)[-sample(999, 300)]
x1   <- quantile(rt(10000, 15), F1)
F2   <- seq(0.001, 0.999, 0.001)[-sample(999, 300)]
x2   <- qnorm(F2)
hold <- cdfDist(x1, F1, x2, F2)
plot(hold)
summary(hold)

#=====> Example 2 <=====#
F1   <- seq(0.001, 0.999, 0.001)[-sample(999, 300)]
x1   <- exp(quantile(rnorm(10000, 1, sd=1), F1))
F2   <- seq(0.001, 0.999, 0.001)[-sample(999, 300)]
x2   <- qchisq(F2, mean(x1))
hold <- cdfDist(x1, F1, x2, F2)
plot(hold)
summary(hold)

#=====> Example 3 <=====#
F1   <- seq(0.001, 0.999, 0.001)[-sample(999, 300)]
x1   <- exp(quantile(rnorm(10000, 0.5, sd=0.5), F1))
F2   <- seq(0.001, 0.999, 0.001)[-sample(999, 300)]
x2   <- qchisq(F2, mean(x1))
hold <- cdfDist(x1, F1, x2, F2)
plot(hold)
summary(hold)

#=====> Example 4 <=====#
F1   <- seq(0.001, 0.999, 0.001)[-sample(999, 300)]
x1   <- exp(quantile(rnorm(10000, 0.5, sd=0.5), F1))
F2   <- seq(0.001, 0.999, 0.001)[-sample(999, 300)]
x2   <- qchisq(F2, mean(x1)+1)
hold <- cdfDist(x1, F1, x2, F2)
plot(hold)
summary(hold)

}
\keyword{ cumulative distribution function }
\keyword{ CDF }
\keyword{ CDF distance }
\keyword{ distance measure }
