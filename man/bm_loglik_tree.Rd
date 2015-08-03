\name{bm_loglik_tree}

\alias{bm_loglik_tree}

\title{
	Point Brownian motion tree likelihood
}

\description{
	For internal use only.
}

\usage{
bm_loglik_tree(tree, values, par, dimen)
}

\arguments{
  \item{tree}{
	 phylogenetic tree of class \code{"phylo"}.
	}
  \item{values}{
 		a list, with each element being one-dimensional trait.
	}
  \item{par}{
	current parameters values.
	}
  \item{dimen}{
	Number of dimensions (number of traits being analyzed).
	}
}

\value{
	Returns the loglikelihood according to a brownian motion usign points.
}

\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. Evolutionary Reconstruction of Species Ranges Through Space and Time
}

\author{
Ignacio Quintero
}

\seealso{
\code{\link{point.like.bm}}
}

\keyword{internal}