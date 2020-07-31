#' Generate random number based on mixture gaussian
#'
#' @param x number of sample to be generated
#' @param pi_0 proportion of skewness to gaussian_1. The value must be between 0 <= pi_0 <= 1
#' @param mu mean of each distribution, given as a vector
#' @param sd sd of each distribution, given as a vector
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' mixture_gaussian(pi = 0.3, mu = c(-5, 5), sd = c(1, 1))
#' N <- 1000
#' x <- sapply(1:N, mixture_gaussian)
#' plot(density(x))
#'
#' }
mixture_gaussian <- function(x, pi_0 = 0.3, mu = c(-5, 5), sd = c(1, 4)) {
  ifelse(runif(1) < pi_0, rnorm(1, mu[1], sd[1]), rnorm(1, mu[2], sd[2]))
}
