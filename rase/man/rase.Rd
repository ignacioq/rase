\name{rase}
\alias{rase}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
rase(tree, polygons, niter = 1000, logevery = 10, sigma2_scale = 0.05, screenlog = TRUE, params0 = NA)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
%%     ~~Describe \code{tree} here~~
}
  \item{polygons}{
%%     ~~Describe \code{polygons} here~~
}
  \item{niter}{
%%     ~~Describe \code{niter} here~~
}
  \item{logevery}{
%%     ~~Describe \code{logevery} here~~
}
  \item{sigma2_scale}{
%%     ~~Describe \code{sigma2_scale} here~~
}
  \item{screenlog}{
%%     ~~Describe \code{screenlog} here~~
}
  \item{params0}{
%%     ~~Describe \code{params0} here~~
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
function (tree, polygons, niter = 1000, logevery = 10, sigma2_scale = 0.05, 
    screenlog = TRUE, params0 = NA) 
{
    if (!is(tree, "phylo")) {
        stop("tree should be of class phylo")
    }
    if (any(is.na(match(tree$tip.label, names(polygons))))) {
        stop("tip labels and polygon names do not match")
    }
    ntaxa = length(tree$tip.label)
    nnode = tree$Nnode
    xy.tips = t(mapply(polygon_centroid, polygons))
    ax = array(NA, dim = c(niter, nnode))
    sigma2x = rep(NA, niter)
    ay = array(NA, dim = c(niter, nnode))
    sigma2y = rep(NA, niter)
    if (any(is.na(params0))) {
        ace_resx = ace(xy.tips[, 1], tree, method = "ML")
        ace_resy = ace(xy.tips[, 2], tree, method = "ML")
        ax[1, (1:nnode)] = ace_resx$ace[1:nnode]
        sigma2x[1] = ace_resx$sigma[1]
        ay[1, (1:nnode)] = ace_resy$ace[1:nnode]
        sigma2y[1] = ace_resy$sigma[1]
    }
    else {
        if (length(params0) != 2 * nnode + 2) 
            stop("starting values not of correct length")
        ax[1, ] = params0[1:nnode]
        sigma2x[1] = params0[2 * nnode + 1]
        ay[1, ] = params0[(nnode + 1):(2 * nnode)]
        sigma2y[1] = params0[2 * nnode + 2]
    }
    for (iter in 2:niter) {
        nodelist = ntaxa + sample(1:nnode, nnode, replace = FALSE)
        ax[iter, ] = ax[iter - 1, ]
        ay[iter, ] = ay[iter - 1, ]
        sigma2x[iter] = sigma2x[iter - 1]
        sigma2y[iter] = sigma2y[iter - 1]
        for (node in nodelist) {
            approx = 0
            daughter_ids = tree$edge[tree$edge[, 1] == node, 
                2]
            t = c(tree$edge.length[tree$edge[, 2] == daughter_ids[1]], 
                tree$edge.length[tree$edge[, 2] == daughter_ids[2]])
            if (daughter_ids[1] <= ntaxa) {
                d1_value = polygons[[daughter_ids[1]]]
                approx = 1
            }
            else {
                d1_value = c(ax[iter, daughter_ids[1] - ntaxa], 
                  ay[iter, daughter_ids[1] - ntaxa])
            }
            if (daughter_ids[2] <= ntaxa) {
                d2_value = polygons[[daughter_ids[2]]]
                approx = 1
            }
            else {
                d2_value = c(ax[iter, daughter_ids[2] - ntaxa], 
                  ay[iter, daughter_ids[2] - ntaxa])
            }
            a_id = tree$edge[tree$edge[, 2] == node, 1]
            if (length(a_id) == 0) {
                a_value = c(NA, NA)
                s = NA
            }
            else {
                a_value = c(ax[iter, a_id - ntaxa], ay[iter, 
                  a_id - ntaxa])
                s = tree$edge.length[a_id - ntaxa]
            }
            xy_prop = bm_propose_trio(a_value, d1_value, d2_value, 
                s, t[1], t[2], sigma2x[iter], sigma2y[iter])
            if (approx) {
                loglik_prop = bm_loglik_trio(a_value, xy_prop$value, 
                  d1_value, d2_value, s, t[1], t[2], sigma2x[iter], 
                  sigma2y[iter])
                loglik_cur = bm_loglik_trio(a_value, c(ax[iter, 
                  node - ntaxa], ay[iter, node - ntaxa]), d1_value, 
                  d2_value, s, t[1], t[2], sigma2x[iter], sigma2y[iter])
                logratio = loglik_prop - loglik_cur + xy_prop$logbwdprob - 
                  xy_prop$logfwdprob
                if (log(runif(1)) < logratio) {
                  ax[iter, node - ntaxa] = xy_prop$value[1]
                  ay[iter, node - ntaxa] = xy_prop$value[2]
                }
            }
            else {
                ax[iter, node - ntaxa] = xy_prop$value[1]
                ay[iter, node - ntaxa] = xy_prop$value[2]
            }
        }
        obj = bm_est_sigma2(tree, list(x = xy.tips[, 1], y = xy.tips[, 
            2]), c(ax[iter, ], ay[iter, ]))
        s2x_cur = obj$sigma2xhat
        s2x_sd = sigma2_scale * obj$sigma2xhat_sd
        s2y_cur = obj$sigma2yhat
        s2y_sd = sigma2_scale * obj$sigma2yhat_sd
        repeat {
            sigma2x_prop = rnorm(1, mean = s2x_cur, sd = s2x_sd)
            if (sigma2x_prop > 0) 
                break
        }
        logprobratiox = dnorm(s2x_cur, sigma2x_prop, sd = s2x_sd, 
            log = TRUE) - dnorm(sigma2x_prop, s2x_cur, sd = s2x_sd, 
            log = TRUE)
        repeat {
            sigma2y_prop = rnorm(1, mean = s2y_cur, sd = s2y_sd)
            if (sigma2y_prop > 0) 
                break
        }
        logprobratioy = dnorm(s2y_cur, sigma2y_prop, sd = s2y_sd, 
            log = TRUE) - dnorm(sigma2y_prop, s2y_cur, sd = s2y_sd, 
            log = TRUE)
        loglik_cur = bm_loglik_ancestors_poly(tree, polygons, 
            c(ax[iter, ], ay[iter, ], sigma2x[iter], sigma2y[iter])) - 
            (log(sigma2x[iter]) + log(sigma2y[iter]))
        loglik_prop = bm_loglik_ancestors_poly(tree, polygons, 
            c(ax[iter, ], ay[iter, ], sigma2x_prop, sigma2y_prop)) - 
            (log(sigma2x_prop) + log(sigma2y_prop))
        logratio = loglik_prop - loglik_cur + logprobratiox + 
            logprobratioy
        if (log(runif(1)) < logratio) {
            sigma2x[iter] = sigma2x_prop
            sigma2y[iter] = sigma2y_prop
        }
        if (screenlog && iter\%\%logevery == 0) {
            if (iter == logevery) {
                cat("Iteration sigma2x sigma2y\n")
                cat(iter, sigma2x[iter], sigma2y[iter], "\n")
            }
            else {
                cat(iter, sigma2x[iter], sigma2y[iter], "\n")
            }
        }
    }
    colnames(ax) = paste("n", names(branching.times(tree)), "_x", 
        sep = "")
    colnames(ay) = paste("n", names(branching.times(tree)), "_y", 
        sep = "")
    return(cbind(ax, ay, sigma2x, sigma2y))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
