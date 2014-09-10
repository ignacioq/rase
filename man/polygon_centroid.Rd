\name{polygon_centroid}
\alias{polygon_centroid}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Temporary title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
polygon_centroid(poly)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{poly}{
%%     ~~Describe \code{poly} here~~
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
function (poly) 
{
    x = poly[, 1]
    y = poly[, 2]
    n = length(x)
    if (length(y) != n) 
        stop("length of x and y must be equal")
    Cx = 0
    Cy = 0
    A = 0
    for (i in 1:(n - 1)) {
        Cx = Cx + (x[i] + x[i + 1]) * (x[i] * y[i + 1] - x[i + 
            1] * y[i])
        Cy = Cy + (y[i] + y[i + 1]) * (x[i] * y[i + 1] - x[i + 
            1] * y[i])
        A = A + x[i] * y[i + 1] - x[i + 1] * y[i]
    }
    A = A/2
    Cx = Cx/(6 * A)
    Cy = Cy/(6 * A)
    return(c(Cx, Cy))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
