\name{phylo.3d}
\alias{phylo.3d}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
phylo.3d(df3, z.scale = 1, pts = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{df3}{
%%     ~~Describe \code{df3} here~~
}
  \item{z.scale}{
%%     ~~Describe \code{z.scale} here~~
}
  \item{pts}{
%%     ~~Describe \code{pts} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
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
function (df3, z.scale = 1, pts = TRUE, ...) 
{
    edg = df3$edge
    if (pts == TRUE) 
        points3d(df3$x, df3$y, z.scale * df3$z)
    for (i in 1:nrow(tree$edge)) {
        x = df3$xyz$x[edg[i, ]]
        y = df3$xyz$y[edg[i, ]]
        z = df3$xyz$z[edg[i, ]]
        lines3d(x, y, z * z.scale, ...)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
