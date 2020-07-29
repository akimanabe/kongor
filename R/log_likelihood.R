#' Calculate log likelihood
#'
#' @param x distribution
#' @param mu mean
#' @param sigma sd
#' @param pi skewness of mixture distribution
#'
#' @return logl ikelihood
#' @export

log_likelihood <- function(x, mu, sigma, pi) {
  sum(log(pi[1] * dnorm(x, mu[1], sqrt(sigma[1])) +
            pi[2] * dnorm(x, mu[2], sqrt(sigma[2]))))
}
