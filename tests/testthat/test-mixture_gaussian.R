context("mixture_gaussian")

test_that("mixture_gaussian exists", {
  expect_is(mixture_gaussian, "function")
})

test_that("mixture_gaussian geneartes a random number", {
  expect_is(mixture_gaussian(1), "numeric")
  expect_length(mixture_gaussian(100), 1)
  expect_gte(mixture_gaussian(1), -100)
})
