\name{bm_est_sigma2}

\alias{bm_est_sigma2}

\title{
Estimate Sigma and Sigma Variance
}
\description{
For internal use only.
}
\usage{
bm_est_sigma2(tree, values, params)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
phylogenetic tree of class \code{"phylo"}.
}
  \item{values}{
	tip trait values
	}
  \item{params}{
	current iteration of tip trait values
}
}
\value{
a list with estimated sigma2x and its' standard deviation and sigma2y and its' standard deviation.
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