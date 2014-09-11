\name{shape.to.rase}

\alias{shape.to.rase}

\title{
	Transform a Shapefile into a format used by rase
}

\description{
	Transforms a Shapefile read by the \code{maptools} package using \code{\link[maptools]{readShapePoly}}.
}
\usage{
	shape.to.rase(shape_poly)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{shape_poly}{
 	an object of class \code{\link[maptools]{SpatialPolygonsDataFrame}}. 
	}
}

\value{
	Returns a list of polygons. Each item on the list is comoposed of a matrix with the first column representing the \code{x} coordinates (Longitude) and the second the \code{y} coordinates (Latitude). The first row should be the same as the old row (cyclic polygon).
}

\author{
	Ignacio Quintero
}

\seealso{
	\code{\link[maptools]{readShapePoly}}
}
\examples{
	\dontrun{
	# the Shapefiles for the distributions of the tips of the tree
	require(maptools)
	psophia_shp
	
	# Transform the shapefile into the format used by rase
	polygons = shape.to.rase(pshophia_shp)
	
	# check the structure of the polygons
	str(polygons)
	}

}