context("Retrieving Statbank Dataset Names")

test_that("a single-word query term will return with correct format", {
  mockery::stub(search_statbank_datasets, # Where
                "get_num_search_results",  # What
                79) # How
  mockery::stub(search_statbank_datasets, # Where
                "get_httr_html_content",  # What
                readRDS("./mocked_data/httr_response_garda.rds") %>%
                  httr::content("text") %>%
                  xml2::read_html()) # How

  invisible(capture.output(test_result <- search_statbank_datasets("garda")))
  expect_is(test_result, "data.frame")
  expect_length(test_result, 2)
  expect_length(test_result[[1]], 90)
  expect_equal(test_result$dataset_code[1], "A0518")
  expect_equal(test_result$dataset_desc[1] %>% substr(1,23),
               "1996 Population Aged 15")
})

test_that("a multiple-word query term will return with correct format", {
  mockery::stub(search_statbank_datasets, # Where
                "get_num_search_results",  # What
                8) # How
  mockery::stub(search_statbank_datasets, # Where
                "get_httr_html_content",  # What
                readRDS("./mocked_data/httr_response_marriage_form.rds") %>%
                  httr::content("text") %>%
                  xml2::read_html()) # How

  invisible(capture.output(
    search_statbank_datasets("marriage form") %>% expect_is("data.frame")))
  invisible(capture.output(
    search_statbank_datasets("marriage form") %>% expect_length(2)))
  invisible(capture.output(
    search_statbank_datasets("marriage form")[[1]] %>% expect_length(8)))
})

test_that("a query with no results will fail gracefully", {
  mockery::stub(search_statbank_datasets, # Where
                "get_num_search_results",  # What
                0) # How
  mockery::stub(search_statbank_datasets, # Where
                "get_httr_html_content",  # What
                readRDS("./mocked_data/httr_response_purple_astronaut.rds") %>%
                  httr::content("text") %>%
                  xml2::read_html()) # How

  # Create a test executor function to generate the warning once and
  # grab the output into test_result for checking expectations.
  test_executor <- function() {
    return(search_statbank_datasets("purple astronaut"))
  }
  invisible(capture.output(
    expect_warning(test_result <- test_executor(),
                   "Your search query did not return any results.")))
  expect_is(test_result, "data.frame")
  expect_length(test_result, 2)
  expect_length(test_result[[1]], 0)
})


test_that("a query with a single result will be stored correctly", {
  mockery::stub(search_statbank_datasets, # Where
                "get_num_search_results",  # What
                1) # How
  mockery::stub(search_statbank_datasets, # Where
                "get_httr_html_content",  # What
                readRDS(
                  "./mocked_data/httr_response_1996_density_electoral.rds"
                  ) %>%
                  httr::content("text", encoding = "ISO-8859-1") %>%
                  xml2::read_html()) # How

 invisible(capture.output(test_result <-
    search_statbank_datasets("1996 density electoral")))
  expect_is(test_result, "data.frame")
  expect_length(test_result, 2)
  expect_length(test_result[[1]], 1)
})
