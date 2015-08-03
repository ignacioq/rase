\name{rase_data}
\docType{data}
\alias{mcmc}
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
\code{psophia_shp} contains the distributions of Psophia species as shapefiles in the format 
 \code{\link[sp]{SpatialPolygonsDataFrame}}. 
\code{psophia_poly} contains the distributions of Psophia species in \code{\link[gpclib]{gpc.poly-class}} format used by \code{\link{rase}}.
\code{psophia_tree} contains Psophia's phylogenetic tree in \code{\link[ape]{phylo}} format. 
\code{mcmc} contains the MCMC run after a 2000 burnin period and sampling every 10 iterations.
}
\source{
Ribas, Camila C., et al. 2011 "A palaeobiogeographic model for biotic diversification within Amazonia over the past three million years." Proceedings of the Royal Society B: Biological Sciences: rspb20111120.

Quintero, I., Keil, P., Jetz, W., Crawford, F.W. 2015. Evolutionary Reconstruction of Species Ranges Through Space and Time. Systematic Biology.
}
\keyword{datasets}

