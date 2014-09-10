\name{bm_propose_duo}
\alias{bm_propose_duo}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Temporary title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bm_propose_duo(a, d, u, t, sx, sy)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{
%%     ~~Describe \code{a} here~~
}
  \item{d}{
%%     ~~Describe \code{d} here~~
}
  \item{u}{
%%     ~~Describe \code{u} here~~
}
  \item{t}{
%%     ~~Describe \code{t} here~~
}
  \item{sx}{
%%     ~~Describe \code{sx} here~~
}
  \item{sy}{
%%     ~~Describe \code{sy} here~~
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
function (a, d, u, t, sx, sy) 
{
    if (!is.null(dim(d))) {
        d = polygon_centroid(d)
    }
    ax = a[1]
    ay = a[2]
    dx = d[1]
    dy = d[2]
    xm1 = (dx * u + ax * (t - u))/t
    xv1 = (t - u) * u * sx/t
    ym1 = (dy * u + ay * (t - u))/t
    yv1 = (t - u) * u * sy/t
    x = rnorm(1, mean = xm1, sd = sqrt(xv1))
    y = rnorm(1, mean = ym1, sd = sqrt(yv1))
    logfwdprob = dnorm(x, mean = xm1, sd = sqrt(xv1), log = TRUE)
    logbwdprob = dnorm(y, mean = ym1, sd = sqrt(yv1), log = TRUE)
    return(list(value = c(x, y), logfwdprob = logfwdprob, logbwdprob = logbwdprob))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
