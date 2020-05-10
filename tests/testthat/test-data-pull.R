test_that("api works", {
  testthat::skip_if_offline(host="data.ibb.gov.tr")
  testthat::skip_on_cran()
  test_data <- get_ibb_wifi_daily_data_usage(params=list(limit=5))
  expect_equal(nrow(test_data), 5)
})
