\name{make_bm_loglik_ancestors_poly}

\alias{make_bm_loglik_ancestors_poly}

\title{
Fast likelihood of ancestors using polygons
}

\description{
For internal use only.
}
\usage{
make_bm_loglik_ancestors_poly(polygons, ntaxa, nnode, tredge, trlen, nGQ)
}

\arguments{
  \item{polygons}{
		list of polygons in \code{\link[spatstat]{owin.object}} format.
	}
  \item{ntaxa}{
    Integer indicating the number of tips.
  }
  \item{nnode}{
    Integer indicating the number of nodes (should be ntaxa - 1).
  }
  \item{tredge}{
    Two-dimensional array indicating the parent -> child for each tree edge (i.e., the 'edge' slot in a \code{\link[ape]{phylo}} object).
  }
  \item{trlen}{
    Vector of the length of each edge (i.e., the 'edge.length' slot in a \code{\link[ape]{phylo}} object).
  }
  \item{nGQ}{
	degree of the one-dimensional Gauss-Legendre quadrature rule (default = 20) as given by \code{\link{polyCub.SV}} in package polyCub.	
  }
}

\value{
	Returns the function to estimate loglikelihood according to brownian motion usign polygons.
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