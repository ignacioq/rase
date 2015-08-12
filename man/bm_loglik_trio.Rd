\name{bm_loglik_trio}

\alias{bm_loglik_trio}

\title{
	Fast likelihood of a 2-dimensional point with two daughters and one ancestor nodes
}

\description{
	For internal use only.
}

\usage{
bm_loglik_trio(a, v, d1, d2, s, t1, t2, sigma2x, sigma2y, areas, daughter_ids, nGQ)
}

\arguments{
  \item{a}{
	vector with ancestor value (x & y).
	}
  \item{v}{
	vector with current point being evaluated (x & y).
	}
  \item{d1}{
	vector with first daughter value (x & y).
	}
  \item{d2}{
	vector with second daughter value (x & y).
	}
  \item{s}{
	time separating \code{v} from ancestor.
	}
  \item{t1}{
	time separating \code{v} from first daughter.
	}
  \item{t2}{
	time separating \code{v} from second daughter.
	}
  \item{sigma2x}{
	current value for sigma2x.
	}
  \item{sigma2y}{
	current value for sigma2y.
	}
	\item{areas}{
	polygonal areas, to save time and not recalculate.
	}
	\item{daughter_ids}{
	the ids of the daughters of the node.
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
Forrest Crawford, Ignacio Quintero
}
\seealso{
\code{\link{rase}}
}

\keyword{internal}