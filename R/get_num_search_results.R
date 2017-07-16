#' Gets the number of search results that a given search term on StatBank
#' will return. Uses web scraping. For internal use by datakindr.
#'
#' @param search_term A search term used to get CSO datasets.
#' @return The number of search results
#' @keywords internal
#' @importFrom magrittr %>% %<>%
#'

get_num_search_results <- function(search_term){
  req <- create_cso_search_url(search_term, 0)
  res <- get_httr_html_content(req)

  # Check if the returned page is a dataset page
  is_mainref_class_present <-
    (res %>%
    parse_node_text(".mainref"))[[1]] %>% length()

  # Otherwise it's a seach results page
  if(is_mainref_class_present == 0) {
    # Try to get the number of search results
    num_results <- try_get_num_results(res)
  } else {
    num_results <- 1 # it's a dataset page
  }
  num_results
}
