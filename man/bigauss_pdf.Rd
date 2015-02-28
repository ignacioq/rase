\name{bigauss_pdf}

\alias{bigauss_pdf}

\title{
	Bivariate Gaussian PDF
}

\description{
	For internal use only.
}

\usage{
bigauss_pdf(s, mx, my, sx, sy, rho)
}

\arguments{
  \item{s}{
	two column matrix that will be evaluated.
	}
  \item{mx}{
	mean in x.
	}
  \item{my}{
	mean in y.
	}
  \item{sx}{
	variance in x.
	}
  \item{sy}{
	variance in y.
	}
  \item{rho}{
	correlation between x and y.
	}
}

\value{
	Function used by \code{\link{polyCub.SV}}
}

\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. Evolutionary Reconstruction of Species Ranges Through Space and Time
}
\author{
Ignacio Quintero, Forrest Crawford
}
\seealso{
\code{\link{rase_fast}}
}
