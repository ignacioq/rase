\name{bm_propose_duo}

\alias{bm_propose_duo}

\title{
	MCMC proposal for a 2-dimensional point with one daughter and one ancestor nodes
}

\description{
	For internal use only.
}

\usage{
	bm_propose_duo(a, d, u, t, sx, sy)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{
	vector with current ancestor value (x & y).
	}
  \item{d}{
	vector with current daughter value (x & y).
	}
  \item{u}{
	time slice (time from node being proposed to \code{t}).
	}
  \item{t}{
	time separating ancestor from daughter.
	}
  \item{sx}{
	current value for sigma2x.
	}
  \item{sy}{
	current value for sigma2y.
	}
}

\value{
	a list with 3 objects. The vector proposal ($value), the logforward probability ($logfwdprob), and the logbackward probability ($logbwdprob).
}
\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. Evolutionary Reconstruction of Species Ranges Through Space and Time
}
\author{
Ignacio Quintero, Forrest Crawford
}
\seealso{
\code{\link{rase.slice}}
}

\keyword{internal}