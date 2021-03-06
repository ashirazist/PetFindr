#' View photos of pets
#' 
#' View the photos of searched pets in a slideshow format.
#'
#' @param animal_df A data frame of animal search results from \code{\link{pf_find_pets}}.
#' @param size The desired size of the animal photos to be shown. One of "small", "medium", "large", or "full".
#'
#' @return A slideshow of animal pictures
#' @export
#'
#' @examples 
#' \dontrun{
#'   puppies <- pf_find_pets(token, type = "dog", age = "baby", breed = "corgi")
#'   pf_view_photos(animal_df = puppies, size = "small")
#'   
#'   bunnies <- pf_find_pets(token, type = "rabbit", age = "baby", limit = 10)
#'   pf_view_photos(animal_df = bunnies, size = "full")
#'   
#'   birds<- pf_find_pets(token, type= "Bird")
#'   pf_view_photos(birds)
#' }
pf_view_photos <- function(animal_df, 
                           size = c("small", "medium", "large", "full")) {
  assertthat::assert_that(is.data.frame(animal_df))
  assertthat::not_empty(animal_df)
  size <- match.arg(size)
  
  animal_photos <- animal_df %>%
    dplyr::select(tidyselect::vars_select(names(animal_df),
                  dplyr::starts_with(paste0("photos.", size), 
                                     ignore.case = TRUE)))
  
  assertthat::not_empty(animal_photos)
  animal_photos <- as.vector(sapply(animal_photos, as.character))
  if(all(is.na(animal_photos))) {
    stop("No photos found :(")
  }
  
  npix <- (as.character(c(100, 300, 600, 600)) %>%
             stats::setNames(c("small", "medium", "large", "full")))[size]
  
  photos <- animal_photos %>%
    stats::na.omit() %>%
    stringr::str_remove(paste0("&width=", npix))
  
  return(photos %>%
           knitr::include_graphics() %>%
           magick::image_read() %>%
           magick::image_scale("x500")
  )
}
