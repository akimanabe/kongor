#' Generate random number based on mixture gaussian
#'
#' @param x
#' @param pi_0 proportion of skewness to gaussian_1. The value must be between 0 <= pi_0 <= 1.
#' @param mu_1 mean of gaussian_1
#' @param mu_2 mean of gaussian_2
#' @param sd_1 sd of gaussian_1
#' @param sd_2 sd of gaussian_2
#'
#' @return
#' @export
#'
#' @examples
mixture_gaussian <- function(x, pi_0 = 0.3, mu_1 = -5, mu_2 = 5, sd_1 = 1, sd_2 = 5) {
  ifelse(runif(1) < pi_0, rnorm(1, mu_1, sd_1), rnorm(1, mu_2, sd_2))
}

N <- 1000
x <- sapply(1:N, mixture_gaussian)
plot(density(x))

