context("create_mixgauss")

test_that("function exists", {
  expect_is(cteate_mixgauss, "function")
})

test_that("function works", {
  expect_equal(length(create_mixgauss(
    n = list(100, 100, 50),
    mean = list(20, 50, 100),
    mu = list(10, 20, 20)
    )), sum(100, 100, 50)
  )
})
