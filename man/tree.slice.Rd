\name{tree.slice}

\alias{tree.slice}

\title{
	Identify tree branches that intersect with a given time slice.
}
\description{
	Identifies the branches in a phylogenetic tree that the slice intersects with. It is used by \code{\link{rase.slice}}.
}
\usage{
	tree.slice(tree, slice)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
	phylogenetic tree of class \code{"phylo"}.
	}
  \item{slice}{
	the time at which to slice. It should be in the same units of the phylogenetic tree.
	}
}

\details{
	The tree must be fully dichotomous and all the tips should be extant lineages (time = 0).
}
\value{
	returns a matrix where each row is an intersecting branch with the following columns: two integers associating the branch (i.e., ancestor, descendant), the age of the ancestral node, and the age of the descendant node.
	}
\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. Evolutionary Reconstruction of Species Ranges Through Space and Time
}
\author{
Ignacio Quintero
}
\seealso{
\code{\link{rase.slice}}
}
\examples{
#load data
	data(rase_data, package = 'rase')	
	
	\dontrun{
	
	# a phylogenetic tree used in the rase run
	psophia_tree
		
	# define the slice of time;
	# for now, let's say 1 Million
	# years ago (Ma)
	slice = 1
	
	# slice the tree
	slice_results = tree.slice(psophia_tree, slice = slice)
	
	#check results
	str(slice_results)
	}

}

