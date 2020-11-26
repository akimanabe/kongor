context("create_mixgauss")

test_that("function exists", {
  expect_is(create_mixgauss, "function")
})

test_that("function works", {
  age <- c(1, 2, 3)
  n   <- c(100, 100, 50)
  mu  <- c(20, 50, 100)
  sd  <- c(10, 20, 20)

  # tibble column number equals to 5
  expect_equal(
    create_mixgauss(age, n, mu, sd) %>%
      ncol(), 5
  )

  # generated length counts equals to sum of n
  expect_equal(
    create_mixgauss(age, n, mu, sd) %>%
      nrow(),
    sum(n)
  )
})

test_that("gaussian mean is adequate", {
  age <- c(1, 2, 3)
  n   <- c(100, 100, 50)
  mu  <- c(20, 50, 100)
  sd  <- c(10, 20, 20)

  expect_equal(
    create_mixgauss(age, n, mu, sd) %>%
      dplyr::filter(age == 1) %>%
      dplyr::pull(length) %>%
      mean(),
    mu[1],
    tolerance = 1
  )
  expect_equal(
    create_mixgauss(age, n, mu, sd) %>%
      dplyr::filter(age == 2) %>%
      dplyr::pull(length) %>%
      mean(),
    mu[2],
    tolerance = 1
  )
  expect_equal(
    create_mixgauss(age, n, mu, sd) %>%
      dplyr::filter(age == 3) %>%
      dplyr::pull(length) %>%
      mean(),
    mu[3],
    tolerance = 1
  )
})
