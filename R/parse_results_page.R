#' Title
#'
#' @param httr_response A httr response object from a Statbank page. Can
#' either be a search results page or a dataset page (i.e., only one
#' result was returned).
#'
#' @return Returns a list of datasets codes and names as a single string per
#' dataset.
#' @keywords internal
#'

parse_results_page <- function(httr_response){
  # Check if it's a dataset page or a results page by looking at length
  is_dataset_page <-
    (httr_response %>% parse_node_text(".mainref"))[[1]] %>% length()

  if(is_dataset_page == 0) { # dataset page (one result)
    node_name <- ".SearchHeadCell"
    current_dataset_names <-
      parse_node_text(httr_response, node_name) %>%
      lapply(stringr::str_trim)
  } else { # results page (multiple results)
    node_name <- ".mainref"
    current_dataset_names <-
      (parse_node_text(httr_response, node_name)[[1]] %>%
         stringr::str_trim())[1]
  }
}
