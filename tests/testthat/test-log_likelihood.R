context("log likelihood")

test_that("function exists", {
  expect_is(log_likelihood, "function")
  expect_error(log_likelihood(10))
})
