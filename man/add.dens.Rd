\name{add.dens}

\alias{add.dens}

\title{
Plot the Posterior Density for each Ancestor in 3D Space
}

\description{
Plots a user-specified \% credible interval from the posterior density for each ancestor according to rase results. It is mapped in 3D space, where the x/z axes are longitude/latitude, and the y axis is time. Although it works by itself, the posterior densities are intended to overlay an existing \code{\link{phylo.3d}} plot (see example).
}

\usage{
add.dens(df3, res, nlevels = 20, y.scale = 1, col = c("red", "blue", "green"), ...)
}

\arguments{
	
  \item{df3}{
	an object from \code{\link{data.for.3d}}.
	}
  \item{res}{
	the output from a rase run.
	}
  \item{nlevels}{
	the credible interval to be plotted for every posterior probabilities. The nlevels is the inverse of the credible interval (CI) to be plotted (e.g., \code{nlevels = 10} will plot the 90\% CI, \code{nlevels = 20} (the default) will plot the 95\%). 
	}
  \item{y.scale}{
	the scale of the time axis (vertical axis). Effectively, the time variable is multiplied by this number. It is very useful for visualization purposes. It should correspond with the other y.scale arguments in \code{\link{phylo.3d}}, \code{\link{add.polygons}}.
	}
  \item{col}{
	vector of colors for the polygons.
	}
  \item{\dots}{
	further arguments to be passed to \code{\link[rgl]{polygon3d}}.
	}
}

\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. 2014. Evolutionary Reconstruction of Species Ranges Through Space and Time
}

\author{
Ignacio Quintero
}

\seealso{
\code{\link{data.for.3d}},\code{\link{phylo.3d}}, \code{\link{add.polygons}}
}

\examples{
# load the mcmc results from rase run, polygons and tree
attach(rase_data)

# transform the data for 3d plotting
df3 = data.for.3d(mcmc, tree, polygons)

# plot the tree in 3D
\dontrun{phylo.3d(df3, y.scale = 10, pts = TRUE)}

# add the polygons representing the tip distributions
\dontrun{add.polygons(df3)}

# add the posterior density at each node of the 3d tree
\dontrun{add.dens(df3, mcmc, y.scale = 10, col = c(2:8))}
}

