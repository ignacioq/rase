\name{bm_propose_trio}
\alias{bm_propose_trio}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Temporary title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bm_propose_trio(a, d1, d2, s, t1, t2, sigma2x, sigma2y)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{
%%     ~~Describe \code{a} here~~
}
  \item{d1}{
%%     ~~Describe \code{d1} here~~
}
  \item{d2}{
%%     ~~Describe \code{d2} here~~
}
  \item{s}{
%%     ~~Describe \code{s} here~~
}
  \item{t1}{
%%     ~~Describe \code{t1} here~~
}
  \item{t2}{
%%     ~~Describe \code{t2} here~~
}
  \item{sigma2x}{
%%     ~~Describe \code{sigma2x} here~~
}
  \item{sigma2y}{
%%     ~~Describe \code{sigma2y} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (a, d1, d2, s, t1, t2, sigma2x, sigma2y) 
{
    if (!is.null(dim(d1))) {
        d1 = polygon_centroid(d1)
    }
    if (!is.null(dim(d2))) {
        d2 = polygon_centroid(d2)
    }
    ax = a[1]
    ay = a[2]
    d1x = d1[1]
    d1y = d1[2]
    d2x = d2[1]
    d2y = d2[2]
    xm1 = (d1x * t2 + d2x * t1)/(t1 + t2)
    xv1 = t1 * t2 * sigma2x/(t1 + t2)
    ym1 = (d1y * t2 + d2y * t1)/(t1 + t2)
    yv1 = t1 * t2 * sigma2y/(t1 + t2)
    if (is.na(ax) || is.na(ay)) {
        x = rnorm(1, mean = xm1, sd = sqrt(xv1))
        y = rnorm(1, mean = ym1, sd = sqrt(yv1))
        logfwdprob = dnorm(x, xm1, sd = sqrt(xv1), log = TRUE)
        logbwdprob = dnorm(y, ym1, sd = sqrt(yv1), log = TRUE)
    }
    else {
        xm2 = (xm1 * s * sigma2x + ax * xv1)/(xv1 + s * sigma2x)
        xv2 = xv1 * s * sigma2x/(xv1 + s * sigma2x)
        x = rnorm(1, mean = xm2, sd = sqrt(xv2))
        ym2 = (ym1 * s * sigma2y + ay * yv1)/(yv1 + s * sigma2y)
        yv2 = yv1 * s * sigma2y/(yv1 + s * sigma2y)
        y = rnorm(1, mean = ym2, sd = sqrt(yv2))
        logfwdprob = dnorm(x, xm1, sd = sqrt(xv1), log = TRUE)
        logbwdprob = dnorm(y, ym1, sd = sqrt(yv1), log = TRUE)
    }
    return(list(value = c(x, y), logfwdprob = logfwdprob, logbwdprob = logbwdprob))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
