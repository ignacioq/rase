\name{random_rase3d}

\alias{random_rase3d}

\title{
	Apply rase to Randomly Generated Data
}

\description{
	Generates a random tree and random tip poygons using a convex hull. It runs rase and then plots the result (optional). It is mostly intended for illustration/ validation purposes.
}

\usage{
	random_rase3d(mean_x = 0, mean_y = 0, sigma2x = 1, sigma2y = 1,
		x_ext = c(0.1, 0.5), y_ext = c(0.1, 0.5), niter = 1e3, 
		logevery = 10, plot.3d = TRUE, zscale = 5, 
		pbtree.list = list(n = 10), 
		phylo.3d.list = list(df3, z.scale = zscale, pts = TRUE), 
		add.polygons.list = list(df3, axes = 2), ...)
}

\arguments{
  \item{mean_x}{
	mean of the Brownian Motion process on the \code{x} axis to be generated according to the tree. By default \code{mean_x = 0}.
}
  \item{mean_y}{
	mean of the Brownian Motion process on the \code{y} axis to be generated according to the tree. By default \code{mean_y = 0}.
}
  \item{sigma2x}{
	rate parameter of the Brownian Motion process on the \code{x} axis to be generated according to the tree. By default \code{sigma2x = 1}.
}
  \item{sigma2y}{
	rate parameter of the Brownian Motion process on the \code{y} axis to be generated according to the tree. By default \code{msgima2y = 0}.
	}
  \item{x_ext}{
	this controls the mean diameter of the polygons to be generated on the \code{x} axis.
}
  \item{y_ext}{
	this controls the mean diameter of the polygons to be generated on the \code{y} axis.
}
  \item{niter}{
	iteration cycle to print current iteration. By default \code{niter = 1000}.
}
  \item{logevery}{
	iteration cycle to print current iteration. By default \code{logevery = 10}.
}
	\item{plot.3d}{
	If \code{TRUE} (default), a 3d plot is generated with the results
	}
  \item{zscale}{
	the scale of the time axis (vertical axis). Effectively, the time variable is multiplied by this number. It is very useful for visualization purposes.
}
  \item{pbtree.list}{
	a list containing arguments to be passed to \code{\link[phytools]{pbtree}}.
}
  \item{phylo.3d.list}{
	a list containing arguments to be passed to \code{\link{phylo.3d}}.
} 
 \item{add.polygons.list}{
	a list containing arguments to be passed to \code{\link{add.polygons}}.
}
\item{\dots}{
	further arguments to be passed to \code{\link{add.dens}}.
	}
}

\value{
returns the output of \code{\link{rase}}.
}

\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. Evolutionary Reconstruction of Species Ranges Through Space and Time
}

\author{
Ignacio Quintero
}

\seealso{
\code{\link{rase}}, \code{\link{phylo.3d}}, \code{\link{add.dens}}, \code{\link{add.polygons}}
}

\examples{
\dontrun{
# run random_rase3d
results_random = random_rase3d()
	
# explore the results
str(results_random)
}
}
