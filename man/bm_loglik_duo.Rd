\name{bm_loglik_duo}
\alias{bm_loglik_duo}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bm_loglik_duo(a, v, d, u, t, sx, sy)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{
%%     ~~Describe \code{a} here~~
}
  \item{v}{
%%     ~~Describe \code{v} here~~
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
function (a, v, d, u, t, sx, sy) 
{
    la = sum(dnorm(v, a, sd = sqrt(u * c(sx, sy)), log = TRUE))
    if (is.null(dim(d))) {
        ld = sum(dnorm(d, v, sd = sqrt((t - u) * c(sx, sy)), 
            log = TRUE))
    }
    else {
        ld = log(as.numeric(polyCub.exact.Gauss(d, v, Sigma = (t - 
            u) * diag(c(sx, sy))))) - log(polygon_area(d))
        if (is.nan(ld)) 
            ld = -1e+30
    }
    return(la + ld)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
