\name{rase.slice}

\alias{rase.slice}

\title{
	Ancestral State Estimation At Any Given Time Slice 
}
\description{
	Estimates the geographical location of ancestors (at branches or, much less likely, at nodes) at any given point in time integrating over a  \code{\link{rase}} or \code{\link{rase_fast}} run.  It first uses \code{\link{tree.slice}} to identify the branches that the slice intersects with and then uses MCMC sampling to approximate the posterior distribution of the ancestor locations.
}
\usage{
	rase.slice(tree, slice, res, polygons, 
	params0 = NA, niter = 1000, logevery = 10, nGQ = 20)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
	 phylogenetic tree of class \code{"phylo"}. The same used in the code{\link{rase}} run.
}
  \item{slice}{
	the time at which to slice. It should be in the same units of the phylogenetic tree.
}
  \item{res}{
	output from \code{\link{rase}}. Ideally, it should be the post-handled mcmc (i.e., already applied burnin and thinning, if applicable; see \code{\link{post.mcmc}}).
	}
  \item{polygons}{
	list of polygons in \code{\link[gpclib]{gpc.poly-class}} format. The same polygons used for the \code{\link{rase}} or \code{\link{rase_fast}} run should be used. 
	}
  \item{params0}{
	optional. A vector of initial parameter values in the following order: x ancestors for each branch in the order given by \code{\link{tree.slice}}, followed by y ancestors in the same order.
	}
  \item{niter}{
	number of MCMC iterations. By default \code{niter = 1000}.
	}
  \item{logevery}{
	iteration cycle to print current iteration. By default \code{logevery = 10}.
	}
	\item{nGQ}{
	degree of the one-dimensional Gauss-Legendre quadrature rule (default = 20) as given by \code{\link{polyCub.SV}} in package polyCub. Bigger numbers make the integration more precise, but takes longer.
	}
}

\value{
returns a matrix where every column represents one parameter.  The first columns (i.e., \code{bX_x}; where X = branch 1, ..., branch i) give the ancestral locations for trait x in the order given by \code{\link{tree.slice}}, followed by the ancestral locations of trait y (i.e., \code{bX_y}).
}
\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. W. 2015 Historical Biogeography Using Species Geographical Ranges. \emph{Systematic Biology}.doi: 10.1093/sysbio/syv057
}

\author{
Ignacio Quintero
Forrest Crawford
}

\seealso{
\code{\link{tree.slice}}, \code{\link{rase}}
}
\examples{
#load data
data(rase_data, package = 'rase')	
	
\dontrun{
# check the data we are going to use
	
# examine the mcmc result from rase 
# after it has been applied a burnin 
# phase and a thinning
str(mcmc)
	
# the phylogenetic tree used in the rase run
psophia_tree

# the polygons used in the rase run
str(psophia_poly)
		
# define the slice of time;
# for now, let's say 1 Million
# years ago (Ma)
slice = 1

# Species names of polygons (in order)
pnames = c('dextralis', 'viridis', 'leucoptera', 'interjecta', 
  'obscura', 'crepitans', 'ochroptera', 'napensis')

# name the polygons
psophia_poly = name.poly(psophia_poly, psophia_tree, poly.names = pnames)
	
# run rase slice
slice_results = rase.slice(psophia_tree, slice = slice, res = mcmc, psophia_poly)
	
#check results
str(slice_results)
}
}

