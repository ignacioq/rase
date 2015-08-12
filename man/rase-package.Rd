\name{rase-package}
\alias{rase-package}
\docType{package}
\title{
Range Ancestral State Estimation
}
\description{
The rase package primarily implements the Range Ancestral State Estimation for phylogeography described in Quintero, I., Keil, P., Jetz, W., Crawford, F. W. 2015 Historical Biogeography Using Species Geographical Ranges. Systematic Biology. doi: 10.1093/sysbio/syv057.  It also includes Bayesian inference of ancestral states under a Brownian Motion model of character evolution and Maximum Likelihood estimation of rase for n-dimensional data.  Visualizing functions in 3D are implemented using the rgl package.
}
\details{
\tabular{ll}{
Package: \tab rase\cr
Type: \tab Package\cr
Version: \tab 0.2-2\cr
Date: \tab 2015-08-12\cr
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
Quintero, I., Keil, P., Jetz, W., Crawford, F. W. 2015 Historical Biogeography Using Species Geographical Ranges. \emph{Systematic Biology}.doi: 10.1093/sysbio/syv057
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
	
# the GPC polygons of Psophia distribution.
psophia_poly

# Species names of polygons (in order)
pnames <- c('dextralis', 'viridis', 'leucoptera', 'interjecta', 
  'obscura', 'crepitans', 'ochroptera', 'napensis')

# name the polygons
psophia_poly <- name.poly(psophia_poly, psophia_tree, 
  poly.names = pnames)

# Run rase for 10 iterations
rase_results <- rase(psophia_tree, psophia_poly, niter = 100)
# Run with higher number of iterations
# rase_results <- rase(psophia_tree, polygons)

# Check the results
str(rase_results)

# post-MCMC handling
rase_results_for_ggmcmc <- post.mcmc(rase_results, burnin=0, thin = 1)
	
#plot the densities for dispersal rates using ggmcmc
require(ggmcmc)
ggs_traceplot(rase_results_for_ggmcmc, family = 'sigma')
}
}