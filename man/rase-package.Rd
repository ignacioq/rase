\name{rase-package}
\alias{rase-package}
\docType{package}
\title{
Range Ancestral State Estimation
}
\description{
The rase package primarily implements the Range Ancestral State Estimation for phylogeography described in Quintero et al., (XXX). It also includes Maximum Likelihood estimation of range ancestral states for n-dimensional data. Visualizing functions in 3D are implemented using the rgl package.
}
\details{
\tabular{ll}{
Package: \tab rase\cr
Type: \tab Package\cr
Version: \tab 0.1-0\cr
Date: \tab 2014-09-05\cr
License: \tab GLP (>=2)\cr
}
}
\author{
Ignacio Quintero,
Forrest Crawford,
Petr Keil

Maintainer: Ignacio Quintero <ignacio.quintero@yale.edu>
}
\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. Evolutionary Reconstruction of Species Ranges Through Space and Time
}

\keyword{ package }

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
	require(maptools)
	psophia_shp
 	plot(psophia_shp)
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
	rase_results = rase(psophia_tree, polygons)
  	# Run with low number of iterations
  	# rase_results = rase(psophia_tree, polygons, niter=100)

	# Check the results
	str(rase_results)

	# post-MCMC handling
	rase_results_for_ggmcmc = post.mcmc(rase_results, burnin=200, thin = 1)
	
	#plot the densities using ggmcmc
	require(ggmcmc)
	ggs_density(rase_results_for_ggmcmc)
	}
}
