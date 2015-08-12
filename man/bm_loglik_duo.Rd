\name{bm_loglik_duo}

\alias{bm_loglik_duo}

\title{
	Likelihood of a 2-dimensional point with one daughter and one ancestor nodes
}
\description{
	For internal use only.
}
\usage{
	bm_loglik_duo(a, v, d, u, t, sx, sy, nGQ)
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
	\item{nGQ}{
	degree of the one-dimensional Gauss-Legendre quadrature rule (default = 20) as given by \code{\link{polyCub.SV}} in package polyCub.	
	}
}

\value{
	loglikelihood of v according to Brownian motion.
}

\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. W. 2015 Historical Biogeography Using Species Geographical Ranges. \emph{Systematic Biology}. doi: 10.1093/sysbio/syv057
}
\author{
Ignacio Quintero, Forrest Crawford
}
\seealso{
\code{\link{rase.slice}}
}

\keyword{internal}