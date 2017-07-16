#' Try To Get The Number of Search Results
#'
#' Uses a \code{tryCatch()} block to get the number of search results, and
#' raises a warning when no results returned.
#'
#' @param res \code{httr} response based on a Statbank search page.
#'
#' @return The number of search results from the Statbank webpage.
#' @keywords internal
#'

try_get_num_results <- function(res) {
  tryCatch({
    (res %>%
       rvest::html_node(".fl") %>%
       rvest::html_text() %>%
       stringr::str_match("made (.*?) results"))[2] %>%
      as.numeric()},
    warning = function(w){
      if (w$message == "NAs introduced by coercion"){
        warning("Your search query did not return any results.")
        res <- 0
      } else {
        warning(w$message) # otherwise just return the warning
      }
    })
}
