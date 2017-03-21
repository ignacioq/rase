\name{make_bm_est_sigma2}

\alias{make_bm_est_sigma2}

\title{
Estimate Sigma and Sigma Variance
}
\description{
For internal use only.
}
\usage{
make_bm_est_sigma2(ntaxa, nnode, wtips, paren, child, trlen)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
phylogenetic tree of class \code{"phylo"}.
}
  \item{ntaxa}{
    Integer indicating the number of tips.
  }
  \item{nnode}{
    Integer indicating the number of nodes (should be ntaxa - 1).
  }
  \item{wtips}{
    Boolean indicating which children is a tip for each tree edge.
  }
  \item{paren}{
    Vector indicating the parent for each tree edge.
  }
  \item{child}{
    Vector indicating the child for each tree edge.
  }
  \item{trlen}{
    Vector of the length of each edge (i.e., the 'edge.length' slot in a \code{\link[ape]{phylo}} object).
  }

}
\value{
 a function that returns a list with estimated sigma2x and its' standard deviation and sigma2y and its' standard deviation.
}
\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. Evolutionary Reconstruction of Species Ranges Through Space and Time
}
\author{
Forrest Crawford, Ignacio Quintero
}
\seealso{
\code{\link{rase}}
}

\keyword{internal}

