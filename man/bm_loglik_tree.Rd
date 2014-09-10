\name{bm_loglik_tree}
\alias{bm_loglik_tree}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Temporary title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bm_loglik_tree(tree, values, par, dimen)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
%%     ~~Describe \code{tree} here~~
}
  \item{values}{
%%     ~~Describe \code{values} here~~
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
function (tree, values, par, dimen) 
{
    A = par[1:dimen]
    Sig = par[(dimen + 1):(dimen * 2)]
    if (any(Sig < 0)) 
        return(-Inf)
    n = length(tree$tip.label)
    V = vcv(tree)
    res = mapply(function(values, A, Sig) dmvnorm(values, mean = rep(A, 
        n), sigma = V * Sig, log = TRUE), values, A, Sig)
    return(sum(res))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
