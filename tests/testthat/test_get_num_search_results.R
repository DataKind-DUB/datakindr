context("Number of Results")

test_that("a typical search returns a single number", {
  mockery::stub(get_num_search_results, # Where
                "get_httr_html_content",  # What
                readRDS("./mocked_data/httr_response_garda.rds") %>%
                  httr::content("text") %>% xml2::read_html()) # How

  test_results <- get_num_search_results("garda")
  expect_is(test_results,"numeric")
  expect_length(test_results,1)
  expect_equal(test_results, 79)
})

test_that("a search with no results returns 0 and gives a warning", {
  mockery::stub(get_num_search_results, # Where
                "get_httr_html_content",  # What
                readRDS("./mocked_data/httr_response_purple_astronaut.rds") %>%
                  httr::content("text") %>% xml2::read_html()) # How

  test_executor <- function() {get_num_search_results("purple astronaut")}

  expect_warning(test_result <- test_executor(),
                 "Your search query did not return any results.")
  expect_is(test_result,"numeric")
  expect_length(test_result,1)
  expect_equal(test_result, 0)
})

test_that("a search with a single result returns 1", {
  mockery::stub(get_num_search_results, # Where
                "get_httr_html_content",  # What
                readRDS(
                  "./mocked_data/httr_response_1996_density_electoral.rds") %>%
                  httr::content("text", encoding = "ISO-8859-1") %>%
                  xml2::read_html()) # How

  test_result <- get_num_search_results("1996 density electoral")
  expect_is(test_result,"numeric")
  expect_length(test_result,1)
  expect_equal(test_result, 1)
})

