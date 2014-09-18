\name{bm_loglik_ancestors_poly}

\alias{bm_loglik_ancestors_poly}

\title{
Likelihood of ancestors using polygons
}

\description{
For internal use only.
}
\usage{
bm_loglik_ancestors_poly(tree, polygons, params)
}

\arguments{
  \item{tree}{
	 phylogenetic tree of class \code{"phylo"}.
}
  \item{polygons}{
	polygons in the output format of \code{\link{shape.to.rase}}. Effectively, it is a list of polygons. Each item on the list is comoposed of a matrix with the first column representing the \code{x} coordinates (Longitude) and the second the \code{y} coordinates (Latitude). The first row should be the same as the old row.
	}
  \item{params}{
	current parameters values.	
}
}

\value{
	Returns the loglikelihood according to brownian motion usign polygons.
}

\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. Evolutionary Reconstruction of Species Ranges Through Space and Time
}
\author{
Forrest Crawford
}
\seealso{
\code{\link{rase}}
}
