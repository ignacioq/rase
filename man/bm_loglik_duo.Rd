\name{bm_loglik_duo}

\alias{bm_loglik_duo}

\title{
	Likelihood of a 2-dimensional point with one daughter and one ancestor nodes
}
\description{
	For internal use only.
}
\usage{
	bm_loglik_duo(a, v, d, u, t, sx, sy)
}

\arguments{
  \item{a}{
	vector with ancestor value (x & y).
	}
  \item{v}{
	vector with current point being evaluated (x & y).
	}
  \item{d}{
	vector with daughter value (x & y).
	}
  \item{u}{
	time slice (time from \code{v} to \code{t}).
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
	loglikelihood of v according to Brownian motion.
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
