\name{tree.slice}
\alias{tree.slice}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Temporary title
}
\description{

}
\usage{
tree.slice(tree, slice)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
%%     ~~Describe \code{tree} here~~
}
  \item{slice}{
%%     ~~Describe \code{slice} here~~
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
function (tree, slice) 
{
    if (!is(tree, "phylo")) {
        stop("tree should be of class phylo")
    }
    if (!is.binary.tree(tree)) {
        stop("tree should be fully dichotomous")
    }
    nnode = tree$Nnode
    ntips = min(tree$edge[, 1]) - 1
    b.t = branching.times(tree)
    rage = cbind(tree$edge, NA, NA)
    rage[match(1:ntips, rage[, 2]), 4] = 0
    rage = rage[order(rage[, 1]), ]
    rage[, 3] = rep(b.t, each = 2)
    rage = rage[order(rage[, 2]), ]
    rage[which(rage[, 2] > ntips), 4] = b.t[2:(ntips - 1)]
    c1 = rage[which(rage[, 3] > slice), ]
    c2 = c1[which(c1[, 4] < slice), ]
    if (nrow(c2) == 0) 
        cat("no branches at that time slice")
    else return(c2)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
