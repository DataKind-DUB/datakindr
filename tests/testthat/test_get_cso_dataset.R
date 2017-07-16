context("Getting CSO Dataset")

test_that("dataframe is correctly returned from Statbank", {
  mockery::stub(get_cso_dataset, # Where
                "rjstat::fromJSONstat",  # What
                readRDS("./mocked_data/sample_statbank_dataset.rds")) # How
  test_results <- get_cso_dataset("ASR11")
  expected_results <-
    data.frame(Sex = "Both sexes",
               `Intermediate Occupational Group` = "All occupations",
               `Census Year` = "1991",
               Statistic = "1996 Population Aged 15 Years and Over at Work (Number)",
               value = 1149080,
               stringsAsFactors = FALSE, check.names = FALSE)

  expect_is(test_results, "data.frame")
  expect_is(test_results[[1]], "character")
  expect_length(test_results, 5)
  expect_equal(test_results[1,], expected_results)
})
