\name{rase_data}
\docType{data}
\alias{mcmc}
\alias{mcmc_FULL}
\alias{psophia_tree}
\alias{psophia_shp}
\alias{psophia_poly}
\title{
	Psophia data used for rase package
}
\description{
	Data used for Quintero et al, (2014) extracted from Ribas et al (2012). It contains the phylogenetic tree and current distributions for the genus \emph{Psophia}.
	}
\usage{
rase_data
}
\format{
 \code{psophia_shp} contains the distributions of Psophia species as shapefiles in the format \code{\link[sp]{SpatialPolygonsDataFrame}}. \code{psophia_poly} contains the distributions of Psophia species in the format used by \code{\link{rase}}.\code{psophia_tree} contains Psophia's phylogenetic tree in \code{\link[ape]{phylo}} format. \code{mcmc_FULL} contains the full MCMC run for the psophia data, as used in Quintero et al., (). \code{mcmc} contains the MCMC run after a 2000 burnin period and sampling every 10 iterations.
}
\source{
Ribas, Camila C., et al. "A palaeobiogeographic model for biotic diversification within Amazonia over the past three million years." Proceedings of the Royal Society B: Biological Sciences (2011): rspb20111120.

Quintero, I., Keil, P., Jetz, W., Crawford, F. 2014. Evolutionary Reconstruction of Species Ranges Through Space and Time
}
\keyword{datasets}

