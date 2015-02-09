\name{poly_center}

\alias{polygon_centroid}

\title{
	Calculate the Polygon Center
}

\description{
	For internal use only.
}

\usage{
	polygon_centroid(poly)
}

\arguments{
  \item{poly}{
	a GPC polygon.
	}
}

\value{
 	If the range is only one polygon, it returns a vector of the polygon centroid coordinates. If it is more than one polygon, it first estimates the center of the polygon and then estimates the weighted mean between the polygons based on their area.
}
\author{
	Ignacio Quintero, Forrest Crawford
}

\seealso{
	\code{\link{rase}}
}
