context("fit_em")

test_that("function works", {
  expect_is(fit_em, "function")
  expect_error(fit_em(mu = 1, sigma = 1, pi = 1))
})
