\name{random_pase3d}
\alias{random_pase3d}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
random_pase3d(mean_x = 0, mean_y = 0, sigma_x = 1, sigma_y = 1, x_ext = c(0.1, 0.5), y_ext = c(0.1, 0.5), n_iter = 1000, logevery = 10, z.scale = 5, pbtree.list = list(n = 10))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mean_x}{
%%     ~~Describe \code{mean_x} here~~
}
  \item{mean_y}{
%%     ~~Describe \code{mean_y} here~~
}
  \item{sigma_x}{
%%     ~~Describe \code{sigma_x} here~~
}
  \item{sigma_y}{
%%     ~~Describe \code{sigma_y} here~~
}
  \item{x_ext}{
%%     ~~Describe \code{x_ext} here~~
}
  \item{y_ext}{
%%     ~~Describe \code{y_ext} here~~
}
  \item{n_iter}{
%%     ~~Describe \code{n_iter} here~~
}
  \item{logevery}{
%%     ~~Describe \code{logevery} here~~
}
  \item{z.scale}{
%%     ~~Describe \code{z.scale} here~~
}
  \item{pbtree.list}{
%%     ~~Describe \code{pbtree.list} here~~
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
function (mean_x = 0, mean_y = 0, sigma_x = 1, sigma_y = 1, x_ext = c(0.1, 
    0.5), y_ext = c(0.1, 0.5), n_iter = 1000, logevery = 10, 
    z.scale = 5, pbtree.list = list(n = 10)) 
{
    tree = do.call(pbtree, pbtree.list)
    nnode = tree$Nnode
    x_locs = as.numeric(rmvnorm(1, rep(mean_x, ntaxa), sigma = sigma_x * 
        vcv(tree)))
    y_locs = as.numeric(rmvnorm(1, rep(mean_y, ntaxa), sigma = sigma_y * 
        vcv(tree)))
    e = 0.5
    polygons = list()
    centers = cbind(x_locs, y_locs)
    for (i in 1:ntaxa) {
        r = centers[i, ]
        polygons[[i]] = matrix(c(r[1] - e, r[1] + e, r[1] + e, 
            r[1] - e, r[1] - e, r[2] - e, r[2] - e, r[2] + e, 
            r[2] + e, r[2] - e), ncol = 2)
    }
    npts = 20
    for (i in 1:ntaxa) {
        xpts = rnorm(npts, x_locs[i], sd = runif(1, x_ext))
        ypts = rnorm(npts, y_locs[i], sd = runif(1, y_ext))
        pts = matrix(c(xpts, ypts), nrow = npts)
        hpts = chull(pts)
        hpts = c(hpts, hpts[1])
        polygons[[i]] = matrix(c(xpts[hpts], ypts[hpts]), nrow = length(hpts))
    }
    res = brase(tree, polygons, c(runif(2 * nnode), sigma_x, 
        sigma_y), niter = n_iter, logevery = logevery)
    df3 = data.for.3d(tree, res, polygons, scale.z = zscale)
    phylo.3d(df3, tree, polygons)
    add.polygons(tree, polygons, axes = 2)
    add.dens(tree, res, col = c(1:nnode), scale.z = zscale)
    if (walls == TRUE) 
        add.walls(df3, tree, col = c(1:nnode), polygons)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
