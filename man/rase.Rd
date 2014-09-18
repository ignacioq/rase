\name{rase}

\alias{rase}

\title{
Bayesian Range Ancestral State Estimation of Polygons
}
\description{
Performs a bayesian two-dimensional ancestral state estimation with polygonal distributions as input (contrast with \code{\link{bm_ase}}) according to a Brownian Motion model of trait evolution (or dispersal for phylogeography). It uses Gibbs sampling to approximate the posterior distribution. See reference at the end for more detailed information.
}
\usage{
rase(tree, polygons, niter = 1000, logevery = 10, 
sigma2_scale = 0.05, screenlog = TRUE, params0 = NA)
}

\arguments{
  \item{tree}{
	 phylogenetic tree of class \code{"phylo"}.
	}
  \item{polygons}{
		polygons in the output format of \code{\link{shape.to.rase}}. Effectively, it is a list of polygons. Each item on the list is comoposed of a matrix with the first column representing the \code{x} coordinates (Longitude) and the second the \code{y} coordinates (Latitude). The first row should be the same as the old row.
	}
 \item{niter}{
	number of MCMC iterations. By default \code{niter = 1000}.
	}
  \item{logevery}{
	Iteration cycle to print current iteration. By default \code{logevery = 10}.
	}
  \item{sigma2_scale}{
	Optional. window proposal for sigma2x & sigma2y.
	}
  \item{screenlog}{
	if \code{TRUE} (default), prints current iteration every \code{logevery} to the screen.
	}
  \item{params0}{
	Optional. A vector of initial parameter values in the following order: x ancestors, y ancestors, sigma2x and sigma2y. If \code{params0 = NA} (default), an initial Maximum Likelihood optimization with polygon centroids using \code{\link[ape]{ace}} provides the starting parameter values.
	}
}

\value{
returns a matrix where every column represents one parameter. The first columns (i.e., \code{nX_x}; where X = node 1, ..., node i) give the ancestral locations for trait x in the order of nodes in the tree (see the \code{phylo} class for details), followed by the ancestral locations of trait y (i.e., \code{nX_y}), and the rate parameter in x (\code{sigma2x}) and y (\code{sigma2y}).
}

\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. Evolutionary Reconstruction of Species Ranges Through Space and Time
}

\author{
Forrest Crawford, Ignacio Quintero
}

\seealso{
Contrast with the point ancestral state estimation \code{\link{bm_ase}}. For the maximum likelihood version of ranges see \code{\link{ranges.like.bm}}. For post-mcmc handling see \code{\link{post.mcmc}}.
}

\examples{
# Here the application in the paper of Quintero et al.,
# on the Psophia trumpeters 
# is shown using rase package.
	
#load data
data(rase_data, package = 'rase')  
	
\dontrun{
# check the data we are going to use
# the phylogenetic tree
psophia_tree
	
# the Shapefiles for the distributions of the tips of the tree
require(sp)
psophia_shp

# check the distribution polygons
plot(psophia_shp)

# check
plot(psophia_tree)
	
# Transform the shapefile into the format used by rase
polygons = shape.to.rase(psophia_shp)

# Species names of polygons (in order)
pnames = c('dextralis', 'viridis', 'leucoptera', 'interjecta', 'obscura', 'crepitans', 'ochroptera', 'napensis')

# name the polygons
polygons = name.poly(polygons, psophia_tree, poly.names = pnames)

# Accept the gpclib licence:
gpclibPermit()

# Run rase
rase_results = rase(psophia_tree, polygons, niter = 100)
# Run with higher number of iterations
# rase_results = rase(psophia_tree, polygons)

# Check the results
str(rase_results)

# post-MCMC handling
rase_results_for_ggmcmc = post.mcmc(rase_results, burnin=0, thin = 1)
	
#plot the densities using ggmcmc
require(ggmcmc)
ggs_density(rase_results_for_ggmcmc)
}
}

