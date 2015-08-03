\name{name.poly}

\alias{name.poly}

\title{
Name & Order Polygons According to the Phylogeny
}

\description{
Names polygons and orders them according to the phylogenetic tree.  If they match the tree perfectly, the following message should appear: "\code{tip labels and polygon names match and 
	are in the same order}".
}

\usage{
name.poly(polygons, tree, poly.names = NA)
}

\arguments{
  \item{polygons}{
	a list of polygons in the output format from \code{\link{shape.to.rase}}.
	}
  \item{tree}{
	phylogenetic tree of class \code{"phylo"}.
	}
  \item{poly.names}{
	optional. Vector of names for the polygons. They should be in the same order as the polygons. If \code{poly.names = NA}, the function assumes the polygons are already named and only checks if they match the tip labels of the phylogenetic tree.
	}
}

\value{
Returns the polygons in the output format from \code{\link{shape.to.rase}}.
}

\author{
Ignacio Quintero
}

\seealso{
\code{\link{shape.to.rase}}
}
\examples{
# attach polygon data
data(rase_data, package = 'rase')

\dontrun{
# polygons already in format used by rase.
str(psophia_poly)

# check the phylogenetic tree
psophia_tree

# Species names of polygons (in order)
pnames = c('dextralis', 'viridis', 'leucoptera', 'interjecta', 
  'obscura', 'crepitans', 'ochroptera', 'napensis')

# check tree's' tip labels
psophia_tree$tip.label

# name the polygons
polygons = name.poly(psophia_poly, psophia_tree, poly.names = pnames)}
}
