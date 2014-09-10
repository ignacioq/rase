\name{bm_loglik_ancestors_poly}
\alias{bm_loglik_ancestors_poly}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Temporary title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bm_loglik_ancestors_poly(tree, polygons, params)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
%%     ~~Describe \code{tree} here~~
}
  \item{polygons}{
%%     ~~Describe \code{polygons} here~~
}
  \item{params}{
%%     ~~Describe \code{params} here~~
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
function (tree, polygons, params) 
{
    ntaxa = length(tree$tip.label)
    nnode = tree$Nnode
    ax = params[1:nnode]
    ay = params[(nnode + 1):(2 * nnode)]
    sigma2x = params[2 * nnode + 1]
    sigma2y = params[2 * nnode + 2]
    if (sigma2x < 0 || sigma2y < 0) 
        return(-Inf)
    dat = cbind(tree$edge, tree$edge.length)
    logliks = apply(dat, 1, function(r) {
        ax1 = ax[r[1] - ntaxa]
        ay1 = ay[r[1] - ntaxa]
        if (r[2] <= ntaxa) {
            v = polyCub.exact.Gauss(polygons[[r[2]]], c(ax1, 
                ay1), Sigma = r[3] * diag(c(sigma2x, sigma2y)))
            logv = ifelse(is.nan(v), -1e+30, log(v))
            loglik = logv - log(polygon_area(polygons[[r[2]]]))
            if (is.nan(loglik)) 
                loglik = -1e+30
        }
        else {
            loglik = sum(dnorm(c(ax[r[1] - ntaxa], ay[r[1] - 
                ntaxa]), c(ax1, ay1), sd = sqrt(r[3] * c(sigma2x, 
                sigma2y)), log = TRUE))
        }
        return(loglik)
    })
    return(sum(logliks))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
