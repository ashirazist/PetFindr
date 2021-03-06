% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pf_map_locations.R
\name{pf_map_locations}
\alias{pf_map_locations}
\title{Display animal locations}
\usage{
pf_map_locations(token, animal_df)
}
\arguments{
\item{token}{An access token, provided by pf_accesstoken(key, secret).}

\item{animal_df}{A data frame of animal information output from pf_find_pets().}
}
\value{
A leaflet map of the locations of animals provided.
}
\description{
Display animal locations
}
\examples{
\dontrun{
pups <- pf_find_pets(token, type = "dog", breed = "corgi", location = "50014", distance = "150")
pf_map_locations(token, pups)
}
}
