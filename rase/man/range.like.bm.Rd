\name{range.like.bm}
\alias{range.like.bm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
range.like.bm(tree, lower_bounds, upper_bounds, start_values = NA, dimen = NA)
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
  \item{start_values}{
%%     ~~Describe \code{start_values} here~~
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
function (tree, lower_bounds, upper_bounds, start_values = NA, 
    dimen = NA) 
{
    if (is.na(dimen)) 
        dimen = length(lower_bounds)
    if (is.na(start_values)) {
        start_values = c((unlist(lapply(lower_bounds, mean)) + 
            unlist(lapply(upper_bounds, mean)))/2, (unlist(lapply(lower_bounds, 
            sd)) + unlist(lapply(upper_bounds, sd)))/2)
    }
    opt.res = nlm(function(p) -1 * bm_loglik_tree_constrained(tree, 
        lower_bounds, upper_bounds, p, dimen), p = start_values)
    return(list(mrcas = opt.res$estimate[1:dimen], rates = opt.res$estimate[(dimen + 
        1):(dimen * 2)], nlm.details = opt.res))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
