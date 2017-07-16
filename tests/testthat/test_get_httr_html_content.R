context("Getting HTTP Response")

test_that("the httr request is successfully parsed into xml document.", {
  mockery::stub(get_httr_html_content, # Where
                "httr::GET",  # What
                readRDS("./mocked_data/httr_response_garda.rds")) # How

  test_results <- get_httr_html_content(create_cso_search_url("garda", 0))

  expect_is(test_results, "xml_document")
})

test_that(
  "the httr request can be parsed into list of strings successfully.", {
  mockery::stub(get_httr_html_content, # Where
                "httr::GET",  # What
                readRDS("./mocked_data/httr_response_garda.rds")) # How

  test_results <-
    get_httr_html_content(create_cso_search_url("garda", 0)) %>%
    parse_node_text(".SearchHeadCell")

  expect_is(test_results,"list")
  expect_length(test_results[[1]], 15)

})

