\name{data.for.3d}

\alias{data.for.3d}

\title{
Transform Output for 3D Plotting
}

\description{
Takes the output from a \code{\link{rase}} or \code{\link{rase_fast}} run, the corresponding phylogenetic tree and tip polygonal distributions to create and object used for the different 3D plotting functions.
}

\usage{
data.for.3d(res, tree, polygons)
}

\arguments{
  \item{res}{
		the output file from a \code{\link{rase}} or \code{\link{rase_fast}} run.
	}
  \item{tree}{
		phylogenetic tree of class \code{"phylo"} used as input for \code{\link{rase}} or \code{\link{rase_fast}}.
	}
  \item{polygons}{
		list of polygons in \code{\link[gpclib]{gpc.poly-class}} format used as input for \code{\link{rase}} or \code{\link{rase_fast}}.
	}
}

\value{
Returns an object required by the plotting functions \code{\link{phylo.3d}}, \code{\link{add.dens}} and \code{\link{add.polygons}}. It is efectively a list with the following elements: \code{$xyz} containing the 3D coordinates, \code{$edge} containing the \code{tree$edge} and \code{$pol} containing the polygons.
}
\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. W. 2015 Historical Biogeography Using Species Geographical Ranges. \emph{Systematic Biology}. doi: 10.1093/sysbio/syv057
}

\author{
Petr Keil, Ignacio Quintero
}

\seealso{
\code{\link{phylo.3d}}, \code{\link{add.dens}}, \code{\link{add.polygons}}, \code{\link{rase}}, \code{\link{rase_fast}}
}

\examples{
# load the mcmc results from rase run, polygons and tree
data(rase_data, package = 'rase')

pnames = c('dextralis', 'viridis', 'leucoptera', 'interjecta', 
'obscura', 'crepitans', 'ochroptera', 'napensis')
polygons = name.poly(psophia_poly, psophia_tree, poly.names = pnames)

# transform the data for 3d plotting
df3 = data.for.3d(mcmc, psophia_tree, polygons)

\dontrun{

# plot the tree in 3D
phylo.3d(df3, z.scale = 10, pts = TRUE)

# add the polygons representing the tip distributions
add.polygons(df3)

# add the posterior density at each node of the 3D tree
add.dens(df3, mcmc, z.scale = 10, col = c(2:8))}
}