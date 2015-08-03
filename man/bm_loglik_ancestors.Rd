\name{bm_loglik_ancestors}

\alias{bm_loglik_ancestors}

\title{
Likelihood of ancestors using points
}
\description{
For internal use only.
}
\usage{
bm_loglik_ancestors(tree, values, params)
}

\arguments{
  \item{tree}{
	 phylogenetic tree of class \code{"phylo"}.
	}
  \item{values}{
	tip trait values.
	}
  \item{params}{
	current parameters values.	
	}
}
\value{
	Returns the loglikelihood according to a brownian motion usign polygons.

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

\keyword{internal}