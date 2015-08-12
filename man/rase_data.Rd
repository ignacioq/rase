\name{rase_data}
\docType{data}
\alias{mcmc}
\alias{psophia_tree}
\alias{psophia_shp}
\alias{psophia_poly}
\title{
	Psophia Data Used for rase Package
}
\description{
	Data used for Quintero et al, (2015) extracted from Ribas et al (2012).  It contains the phylogenetic tree and current geographic distributions for the genus \emph{Psophia}.
	}
\usage{
rase_data
}
\format{
\code{psophia_shp} contains the distributions of Psophia species as shapefiles in the format 
 \code{\link[sp]{SpatialPolygonsDataFrame}}. 
\code{psophia_poly} contains the distributions of Psophia species as a list of polygons in \code{\link[spatstat]{owin.object}} format used as input for \code{\link{rase}}.
\code{psophia_tree} contains Psophia's phylogenetic tree in \code{\link[ape]{phylo}} format. 
\code{mcmc} contains the MCMC chain of rase run over the Psophia data after a 2000 burnin period and sampling every 10 iterations.
}
\source{
Ribas, C. C., Aleixo, A., Nogueira, A. C. R., Miyaki, C. Y., and Cracraft, J. 2011 A palaeobiogeographic model for biotic diversification within Amazonia over the past three million years. \emph{Proc. R. Soc. B}.

Quintero, I., Keil, P., Jetz, W., Crawford, F. W. 2015 Historical Biogeography Using Species Geographical Ranges. \emph{Systematic Biology}. doi: 10.1093/sysbio/syv057
}
\keyword{datasets}

