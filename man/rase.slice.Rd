\name{rase.slice}
\alias{rase.slice}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
rase.slice(tree, slice, res, polygons, params0 = NA, niter = 1000, logevery = 10)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
%%     ~~Describe \code{tree} here~~
}
  \item{slice}{
%%     ~~Describe \code{slice} here~~
}
  \item{res}{
%%     ~~Describe \code{res} here~~
}
  \item{polygons}{
%%     ~~Describe \code{polygons} here~~
}
  \item{params0}{
%%     ~~Describe \code{params0} here~~
}
  \item{niter}{
%%     ~~Describe \code{niter} here~~
}
  \item{logevery}{
%%     ~~Describe \code{logevery} here~~
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
function (tree, slice, res, polygons, params0 = NA, niter = 1000, 
    logevery = 10) 
{
    if (!is(tree, "phylo")) {
        stop("tree should be of class phylo")
    }
    if (any(is.na(match(tree$tip.label, names(polygons))))) {
        stop("tip labels and polygon names do not match")
    }
    a_d = tree.slice(tree, slice)
    ntaxa = length(tree$tip.label)
    nbranch = nrow(a_d)
    anc_x = res[, a_d[, 1] - ntaxa]
    anc_y = res[, tree$Nnode + a_d[, 1] - ntaxa]
    if (is.na(params0)) {
        for (b in 1:nbranch) {
            if (a_d[b, 4] == 0) {
                pxy = polygon_centroid(polygons[[b]])
                params0[b] = ((mean(anc_x[, b]) * (slice - a_d[b, 
                  4])) + (pxy[1] * (a_d[b, 3] - slice)))/(a_d[b, 
                  3] - a_d[b, 4])
                params0[b + nbranch] = ((mean(anc_y[, b]) * (slice - 
                  a_d[b, 4])) + (pxy[2] * (a_d[b, 3] - slice)))/(a_d[b, 
                  3] - a_d[b, 4])
            }
            else {
                params0[b] = ((mean(anc_x[, b]) * (slice - a_d[b, 
                  4])) + (mean(res[, a_d[b, 2] - ntaxa]) * (a_d[b, 
                  3] - slice)))/(a_d[b, 3] - a_d[b, 4])
                params0[b + nbranch] = ((mean(anc_y[, b]) * (slice - 
                  a_d[b, 4])) + (mean(res[, tree$Nnode + a_d[b, 
                  2] - ntaxa]) * (a_d[b, 3] - slice)))/(a_d[b, 
                  3] - a_d[b, 4])
            }
        }
        cat("Using time weighted mean as starting parameter values \n")
    }
    else {
        if (length(params0) != (nrow(a_d) * 2)) 
            stop("starting values not of correct length")
    }
    bx = array(NA, dim = c(niter, nbranch))
    bx[1, ] = params0[1:nbranch]
    by = array(NA, dim = c(niter, nbranch))
    by[1, ] = params0[(nbranch + 1):(2 * nbranch)]
    sigma2x = res[, ncol(res) - 1]
    sigma2y = res[, ncol(res)]
    for (iter in 2:niter) {
        if (logevery && iter\%\%logevery == 0) 
            cat("iter =", iter, "\n")
        samp = sample(1:length(sigma2x), 1)
        sx = sigma2x[samp]
        sy = sigma2y[samp]
        bx[iter, ] = bx[iter - 1, ]
        by[iter, ] = by[iter - 1, ]
        for (i in 1:nbranch) {
            approx = 0
            a_value = c(anc_x[samp, i], anc_y[samp, i])
            t = a_d[i, 3] - a_d[i, 4]
            u = a_d[i, 3] - slice
            daughter_id = a_d[i, 2]
            if (daughter_id <= ntaxa) {
                d_value = polygons[[daughter_id]]
                approx = 1
            }
            else {
                d_value = c(res[samp, a_d[i, 2] - ntaxa], res[samp, 
                  tree$Nnode + a_d[i, 2] - ntaxa])
            }
            xy_prop = bm_propose_duo(a_value, d_value, u, t, 
                sx, sy)
            if (approx) {
                loglik_prop = bm_loglik_duo(a_value, xy_prop$value, 
                  d_value, u, t, sx, sy)
                loglik_cur = bm_loglik_duo(a_value, c(bx[iter, 
                  i], by[iter, i]), d_value, u, t, sx, sy)
                logratio = loglik_prop - loglik_cur + xy_prop$logbwdprob - 
                  xy_prop$logfwdprob
                if (log(runif(1)) < logratio) {
                  bx[iter, i] = xy_prop$value[1]
                  by[iter, i] = xy_prop$value[2]
                }
            }
            else {
                bx[iter, i] = xy_prop$value[1]
                by[iter, i] = xy_prop$value[2]
            }
        }
    }
    colnames(bx) = paste("b", 1:nbranch, "_x", sep = "")
    colnames(by) = paste("b", 1:nbranch, "_y", sep = "")
    return(cbind(bx, by))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
