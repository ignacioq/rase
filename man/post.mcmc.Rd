\name{post.mcmc}
\alias{post.mcmc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
post.mcmc(res, burnin = 1000, thin = 10, as.ggmcmc = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{res}{
%%     ~~Describe \code{res} here~~
}
  \item{burnin}{
%%     ~~Describe \code{burnin} here~~
}
  \item{thin}{
%%     ~~Describe \code{thin} here~~
}
  \item{as.ggmcmc}{
%%     ~~Describe \code{as.ggmcmc} here~~
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
function (res, burnin = 1000, thin = 10, as.ggmcmc = TRUE) 
{
    mc = res[-(1:burnin), ]
    mc = mc[seq(1, dim(mc)[1], thin), ]
    if (as.ggmcmc == TRUE) {
        fgg = data.frame(Iteration = rep(1:dim(mc)[1], dim(mc)[2]), 
            Chain = rep(1, dim(mc)[1] * dim(mc)[2]), Parameter = rep(colnames(mc), 
                each = dim(mc)[1]), value = as.vector(mc))
        attr(fgg, "nChains") = as.integer(1)
        attr(fgg, "nParameters") = dim(mc)[2]
        attr(fgg, "nIterations") = dim(mc)[1]
        attr(fgg, "nBurnin") = burnin
        attr(fgg, "nThin") = thin
        attr(fgg, "description") = "S"
        attr(fgg, "parallel") = FALSE
        return(fgg)
    }
    else {
        return(mc)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
