context("Parsing HTTP Response: List -> Dataframe")

test_that("results list is converted correctly", {
  results_list <-
    readRDS("./mocked_data/httr_response_garda.rds") %>%
    httr::content("text") %>%
    xml2::read_html() %>%
    parse_node_text(".SearchHeadCell")

  expect_is(results_to_dataframe(results_list), "data.frame")
  expect_length(results_to_dataframe(results_list)[[1]], 15)
  expect_length(results_to_dataframe(results_list), 2)
})
