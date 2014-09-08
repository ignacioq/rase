\name{add.polygons}

\alias{add.polygons}

\title{
Plot the Distributions for the Phylogenetic Tips in 3D
}

\description{
Plots the polygon surfaces of the tips of the phylogeny. It is mapped in 3D space, where the x/z axes are longitude/latitude, and the y axis is time. Although it works by itself, the polygons are intended to overlay an existing \code{\link{phylo.3d}} plot (see example).
}

\usage{
add.polygons(df3, axes = 2, ...)
}

\arguments{
  \item{df3}{
	an object from \code{\link{data.for.3d}}.
	}
  \item{axes}{
	number of axes to be plotted (1 = 'x', 2 = 'x' & 'y', 3 = 'x', 'y' & 'z').
	}
  \item{\dots}{
	further arguments to be passed to \code{\link[rgl]{polygon3d}}.
	}
}

\details{
The polygons don't have to be non-overlapping, however, when they do, they 'flicker'.
}

\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. 2014. Evolutionary Reconstruction of Species Ranges Through Space and Time
}

\author{
Petr Keil
}

\seealso{
\code{\link{data.for.3d}},\code{\link{phylo.3d}}, \code{\link{add.dens}}
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
