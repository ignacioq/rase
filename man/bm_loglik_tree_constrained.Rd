\name{bm_loglik_tree_constrained}
\alias{bm_loglik_tree_constrained}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Temporary title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bm_loglik_tree_constrained(tree, lower_bounds, upper_bounds, par, dimen)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
%%     ~~Describe \code{tree} here~~
}
  \item{lower_bounds}{
%%     ~~Describe \code{lower_bounds} here~~
}
  \item{upper_bounds}{
%%     ~~Describe \code{upper_bounds} here~~
}
  \item{par}{
%%     ~~Describe \code{par} here~~
}
  \item{dimen}{
%%     ~~Describe \code{dimen} here~~
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
function (tree, lower_bounds, upper_bounds, par, dimen) 
{
    A = par[1:dimen]
    Sig = par[(dimen + 1):(dimen * 2)]
    if (any(Sig < 0)) {
        return(-1e+30)
    }
    n = length(tree$tip.label)
    V = vcv(tree)
    res = mapply(function(lower_bounds, upper_bounds, A, Sig) pmvnorm(lower_bounds, 
        upper_bounds, mean = rep(A, n), sigma = V * Sig), lower_bounds, 
        upper_bounds, A, Sig)
    area_cor = mapply(function(upper_bounds, lower_bounds) sum(log(upper_bounds - 
        lower_bounds)), upper_bounds, lower_bounds)
    v = sum(log(as.numeric(res))) - sum(area_cor)
    if (is.nan(v) || abs(v) == Inf) 
        v = -1e+30
    return(v)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
