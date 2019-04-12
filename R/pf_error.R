pf_error <- function(status_code) {
  message <- switch(as.character(status_code),
                    "200" = "OK",
                    "400" = "The request is missing parameters or contains invalid parameters.",
                    "401" = "Access was denied due to invalid credentials. This could be an invalid API key/secret combination, missing access token, or expired access token.",
                    "403" = "Access denied due to insufficient access.",
                    "404" = "The requested resource was not found.",
                    "500" = "The request ran into an unexpected error. If the problem persists, please contact support at https://www.petfinder.com/developers/support/.",
                    "00001" = "The request has missing parameters.",
                    "00002" = "Your request contains invalid parameters.")
  return(message)
}