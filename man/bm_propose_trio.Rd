\name{bm_propose_trio}

\alias{bm_propose_trio}

\title{
	MCMC proposal for a 2-dimensional point with two daughters and one ancestor nodes
}

\description{
	For internal use only.
}

\usage{
	bm_propose_trio(a, d1, d2, s, t1, t2, sigma2x, sigma2y)
}

\arguments{
  \item{a}{
	vector with current ancestor value (x & y).
	}
  \item{d1}{
	vector with current first daughter value (x & y).
	}
  \item{d2}{
	vector with current second daughter value (x & y).
	}
  \item{s}{
	time separating node being proposed from ancestor.
	}
  \item{t1}{
	time separating node being proposed from first daughter.
	}
  \item{t2}{
	time separating node being proposed from second ancestor.
	}
  \item{sigma2x}{
	current value for sigma2x.
	}
  \item{sigma2y}{
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
Forrest Crawford
}

\seealso{
\code{\link{rase}}
}

\keyword{internal}