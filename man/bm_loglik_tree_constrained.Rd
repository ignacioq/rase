\name{bm_loglik_tree_constrained}

\alias{bm_loglik_tree_constrained}

\title{
	Range Brownian motion tree likelihood
}
\description{
	For internal use only.
}

\usage{
bm_loglik_tree_constrained(tree, lower_bounds, upper_bounds, par, dimen)
}

\arguments{
  \item{tree}{
	 phylogenetic tree of class \code{"phylo"}.
	}
  \item{lower_bounds}{
 		a list, with each element being one-dimensional lower bounds for a trait.
	}
  \item{upper_bounds}{
 		a list, with each element being one-dimensional upper bounds for a trait.
	}
  \item{par}{
	current parameters values.
	}
  \item{dimen}{
	Number of dimensions (number of traits being analyzed).
	}
}

\value{
	Returns the loglikelihood according to a brownian motion usign ranges.
}

\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. W. 2015 Historical Biogeography Using Species Geographical Ranges. \emph{Systematic Biology}. doi: 10.1093/sysbio/syv057
}

\author{
Ignacio Quintero
}

\seealso{
\code{\link{ranges.like.bm}}
}

\keyword{internal}