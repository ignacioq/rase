\name{shape.to.rase}

\alias{shape.to.rase}

\title{
	Transform a Shapefile into \code{\link[spatstat]{owin.object}} Format
}

\description{
	Transforms a Shapefile in format \code{\link[sp]{SpatialPolygonsDataFrame}} to the format \code{\link[spatstat]{owin.object}} used by \code{\link{rase}}.
}
\usage{
	shape.to.rase(shape_poly)
}

\arguments{
  \item{shape_poly}{
 	an object of class \code{\link[sp]{SpatialPolygonsDataFrame}}. 
	}
}

\value{
	Returns a list of polygons in \code{\link[spatstat]{owin.object}} format.
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
data(rase_data, package = 'rase')	

psophia_shp
	
# Transform the shapefile into the format used by rase
polygons = shape.to.rase(psophia_shp)
	
# check the structure of the polygons
polygons
}

}
