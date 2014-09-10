\name{bm_loglik_trio}
\alias{bm_loglik_trio}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Temporary title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bm_loglik_trio(a, v, d1, d2, s, t1, t2, sigma2x, sigma2y)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{
%%     ~~Describe \code{a} here~~
}
  \item{v}{
%%     ~~Describe \code{v} here~~
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
function (a, v, d1, d2, s, t1, t2, sigma2x, sigma2y) 
{
    if (is.na(a[1])) {
        la = 0
    }
    else {
        la = sum(dnorm(v, a, sd = sqrt(s * c(sigma2x, sigma2y)), 
            log = TRUE))
    }
    if (is.null(dim(d1))) {
        l1 = sum(dnorm(d1, v, sd = sqrt(t1 * c(sigma2x, sigma2y)), 
            log = TRUE))
    }
    else {
        l1 = log(as.numeric(polyCub.exact.Gauss(d1, v, Sigma = t1 * 
            diag(c(sigma2x, sigma2y))))) - log(polygon_area(d1))
        if (is.nan(l1)) 
            l1 = -1e+30
    }
    if (is.null(dim(d2))) {
        l2 = sum(dnorm(d2, v, sd = sqrt(t2 * c(sigma2x, sigma2y)), 
            log = TRUE))
    }
    else {
        l2 = log(as.numeric(polyCub.exact.Gauss(d2, v, Sigma = t2 * 
            diag(c(sigma2x, sigma2y))))) - log(polygon_area(d2))
        if (is.nan(l2)) 
            l2 = -1e+30
    }
    return(la + l1 + l2)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
