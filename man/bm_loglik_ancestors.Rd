\name{bm_loglik_ancestors}
\alias{bm_loglik_ancestors}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Temporary title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bm_loglik_ancestors(tree, values, params)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
%%     ~~Describe \code{tree} here~~
}
  \item{values}{
%%     ~~Describe \code{values} here~~
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
function (tree, values, params) 
{
    ntaxa = length(tree$tip.label)
    nnode = tree$Nnode
    ax = params[1:nnode]
    ay = params[(nnode + 1):(2 * nnode)]
    sigma2x = params[2 * nnode + 1]
    sigma2y = params[2 * nnode + 2]
    if (sigma2x < 0 || sigma2y < 0) 
        return(-Inf)
    tips = tree$edge[, 2] <= ntaxa
    ax1 = ax[tree$edge[, 1] - ntaxa]
    ax2 = rep(NA, length(ax1))
    ax2[tips] = values$x[tree$edge[tips, 2]]
    ax2[!tips] = ax[tree$edge[!tips, 2] - ntaxa]
    ay1 = ay[tree$edge[, 1] - ntaxa]
    ay2 = rep(NA, length(ay1))
    ay2[tips] = values$y[tree$edge[tips, 2]]
    ay2[!tips] = ay[tree$edge[!tips, 2] - ntaxa]
    lx = -1 * sum((ax1 - ax2)^2/tree$edge.length)/(2 * sigma2x) - 
        nnode * log(sigma2x)
    ly = -1 * sum((ay1 - ay2)^2/tree$edge.length)/(2 * sigma2y) - 
        nnode * log(sigma2y)
    return(lx + ly)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
