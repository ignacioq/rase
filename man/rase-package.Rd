\name{rase-package}
\alias{rase-package}
\alias{rase}
\docType{package}
\title{
What the package does (short line)
~~ package title ~~
}
\description{
More about what it does (maybe more than one line)
~~ A concise (1-5 lines) description of the package ~~
}
\details{
\tabular{ll}{
Package: \tab rase\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-09-05\cr
License: \tab What license is it under?\cr
}
~~ An overview of how to use the package, including the most important functions ~~
}
\author{
Who wrote it

Maintainer: Who to complain to <yourfault@somewhere.net>
~~ The author and/or maintainer of the package ~~
}
\references{
~~ Literature or other references for background information ~~
}
~~ Optionally other standard keywords, one per line, from file KEYWORDS in the R documentation directory ~~
\keyword{ package }
\seealso{
~~ Optional links to other man pages, e.g. ~~
~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
}
\examples{
	# Here the application in the paper of Quintero et al.,
	# on the Psophia trumpeters 
	# is shown using rase package.
	
	#load data
	attach(rase_data)
	
	# check the data we are going to use
	# the phylogenetic tree
	\dontrun{psophia_tree
	
	# the Shapefiles for the distributions of the tips of the tree
	require(maptools)
	psophia_shp
	
	# Transform the shapefile into the format used by rase
	polygons = shape.to.rase(pshophia_shp)

	# Species names of polygons (in order)
	pnames = c('dextralis', 'viridis', 'leucoptera', 'interjecta', 'obscura', 'crepitans', 'ochroptera', 'napensis')

	# name the polygons
 	polygons = name.poly(polygons, tree, poly.names = pnames)

	# Run rase
	rase_results = rase(psophia_tree, polygons)

	# Check the results
	str(rase_results)

	# post-MCMC handling
	rase_results_for_ggmcmc = post.mcmc(rase_results, burnin=200, thin = 1)
	
	#plot the densities using ggmcmc
	require(ggmcmc)
	ggs_density(rase_results_for_ggmcmc)
	}
}
