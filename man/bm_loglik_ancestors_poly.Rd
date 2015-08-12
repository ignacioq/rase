\name{bm_loglik_ancestors_poly}

\alias{bm_loglik_ancestors_poly}

\title{
Fast likelihood of ancestors using polygons
}

\description{
For internal use only.
}
\usage{
bm_loglik_ancestors_poly(tree, polygons, params, nGQ)
}

\arguments{
  \item{tree}{
	 phylogenetic tree of class \code{"phylo"}.
}
  \item{polygons}{
		list of polygons in \code{\link[spatstat]{owin.object}} format.
	}
  \item{params}{
	current parameters values.	
}
  \item{nGQ}{
	degree of the one-dimensional Gauss-Legendre quadrature rule (default = 20) as given by \code{\link{polyCub.SV}} in package polyCub.	
}
}

\value{
	Returns the loglikelihood according to brownian motion usign polygons.
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