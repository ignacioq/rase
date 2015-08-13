\name{ranges.like.bm}

\alias{ranges.like.bm}

\title{
	n-dimensional Maximumn Likelihood of Range Brownian Motion
}

\description{
	Estimates Most Recent Common Ancestor (MRCA) states and the Brownian rate according to a Brownian Motion model of trait evolution using Maximum Likelihood.  The input for each trait is a one-dimensional range for every tip of the phylogenetic tree (e.g., if your trait is weight, instead of a 1 value input for each tip, usually the average, you can input the whole range of weights for that tip).  It can be used for several dimensions simultaneously. 
}

\usage{
ranges.like.bm(tree, lower_bounds, upper_bounds, start_values = NA, dimen = NA)
}

\arguments{
  \item{tree}{
		phylogenetic tree of class \code{"phylo"}.
	}
  \item{lower_bounds}{
 		a list, with each element being one-dimensional lower bounds for a trait.
	}
  \item{upper_bounds}{
 		a list, with each element being one-dimensional upper bounds for a trait.
	}
  \item{start_values}{
	Optional. A vector of starting values for the Maximum Likelihood optimization. The funtion only estimates the MRCA and the rates for each trait, and that should be the order of the input starting values. 
	}
  \item{dimen}{
	Optional. Number of dimensions (number of traits being analyzed). If \code{dimen = NA}, dimensions are obtained from \code{values}.
	}
}

\value{
	
Returns a list with the following components:
	\item{mrcas}{
		Most recent common ancestor estimates for each trait
	}
	\item{rates}{
		Brownian motion rate parameters for each trait.
	}
	\item{nlm.details}{
		A list with the results from nlm optimization. For details see \code{\link[stats]{nlm}}.
	}
}



\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. W. 2015 Historical Biogeography Using Species Geographical Ranges. \emph{Systematic Biology}. doi: 10.1093/sysbio/syv057
}
\author{
Ignacio Quintero
}

\seealso{
Contrast with \code{\link{point.like.bm}}
}
\examples{
# Number of taxa to simulate tree
ntaxa <- 10

# Known parameters 
# for three dimension
mean_x <- 0
mean_y <- 0
mean_z <- 0

sigma2x <- 1 
sigma2y <- 2
sigma2z <- 3

# Create a random tree
tree <- phytools::pbtree(n = ntaxa)

# Create random data according to tree structure
x_locs <- as.numeric(mvtnorm::rmvnorm(1, rep(mean_x,ntaxa), sigma=sigma2x*vcv(tree)))
y_locs <- as.numeric(mvtnorm::rmvnorm(1, rep(mean_y,ntaxa), sigma=sigma2y*vcv(tree)))
z_locs <- as.numeric(mvtnorm::rmvnorm(1, rep(mean_z,ntaxa), sigma=sigma2z*vcv(tree)))

# random shifts to the mean to create ranges
xshift <- rexp(ntaxa)
yshift <- rexp(ntaxa)
zshift <- rexp(ntaxa)
x_lower <- x_locs - xshift
x_upper <- x_locs + xshift
y_lower <- y_locs - yshift
y_upper <- y_locs + yshift
z_lower <- z_locs - zshift
z_upper <- z_locs + zshift

# store rectangles: this is the trait data:
lower_bounds <- list(xl=x_lower, yl=y_lower, zl=z_lower ) 
upper_bounds <- list(xu=x_upper, yu=y_upper, zu=z_upper) 

\dontrun{
#run range.like.bm
range_results <- ranges.like.bm(tree, lower_bounds, upper_bounds)}
}