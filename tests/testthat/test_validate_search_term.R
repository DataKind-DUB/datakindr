context("Search Term Validation")

test_that("error is generated for too many search results.", {
  expect_equal(
    tryCatch(
      validate_search_term("garda", 1500, 500),
      error = function(e) {
        e$message
      }
    ) %>% substr(1, 24),
    "Too many search results.")
})

test_that("error is generated when no search result.", {
  expect_warning(validate_search_term("age", 0, 500),
               "Your search query did not return any results.")
})

test_that("error is generated when negative number of results.", {
  expect_error(validate_search_term("age", -1, 500),
               "Something is very wrong: You can't have a negative number of search results.")
})
