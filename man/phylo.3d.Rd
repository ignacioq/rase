\name{phylo.3d}

\alias{phylo.3d}

\title{
Plots a Phylogenic Tree in 3D
}

\description{
Plots a phylogenetic tree in 3D using rgl. It is mapped in 3D space, where the x/y axes are longitude/latitude, and the z axis is time. It is used as the first plot function to visualize the results of rase with \code{\link{add.dens}} and \code{\link{add.polygons}} (see example).
}

\usage{
phylo.3d(df3, z.scale = 1, pts = TRUE, ...)
}

\arguments{
  \item{df3}{
	an object from \code{\link{data.for.3d}}.
	}
  \item{z.scale}{
the scale of the time axis (vertical axis). Effectively, the time variable is multiplied by this number. It is very useful for visualization purposes. It should correspond with the z.scale argument in \code{\link{add.dens}}.
	}
  \item{pts}{
if \code{TRUE}, points in the verices are plotted.
	}
  \item{\dots}{
	further arguments to be passed to \code{\link[rgl]{lines3d}}.
	}
}

\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. 2014. Evolutionary Reconstruction of Species Ranges Through Space and Time
}

\author{
Petr Keil
}

\seealso{
\code{\link{data.for.3d}},\code{\link{add.dens}}, \code{\link{add.polygons}}
}

\examples{
# load the mcmc results from rase run, polygons and tree
attach(rase_data)

# transform the data for 3d plotting
df3 = data.for.3d(mcmc, tree, polygons)

# plot the tree in 3D
\dontrun{phylo.3d(df3, z.scale = 10, pts = TRUE)}

# add the polygons representing the tip distributions
\dontrun{add.polygons(df3)}

# add the posterior density at each node of the 3d tree
\dontrun{add.dens(df3, mcmc, z.scale = 10, col = c(2:8))}
}
