#' Estimate mixture gaussian distribution by EM algorithm
#'
#' @param x distribution
#' @param mu mu as vector of initial mean of each gaussian
#' @param sigma vector of initial sd of each gaussian
#' @param pi vector of sum of initial proportion of mixture gaussian
#' @export
fit_em <- function(x, mu = c(-1, 1), sigma = c(1, 2), pi = c(0.5, 0.5)) {

  gamma_0 <- c()
  gamma_1 <- c()
  n_k <- c()
  log_likelihood_history <- c()

  for(step in 1:1000) {
    old_log_likelihood <- log_likelihood(x, mu, sigma, pi)
    log_likelihood_history <- c(log_likelihood_history, old_log_likelihood)

    # E-step
    # gamma_0はクラス0の混合係数、gamma_1はクラス1の混合係数
    gamma_1 <- pi[1] * dnorm(x, mu[1], sqrt(sigma[1])) /
      (pi[1] * dnorm(x, mu[1], sqrt(sigma[1])) + pi[2] * dnorm(x, mu[2], sqrt(sigma[2])))
    gamma_2 <- 1 - gamma_1

    # M-step
    n_k[1] <- sum(gamma_1)
    n_k[2] <- sum(gamma_2)
    mu[1] <-  sum(gamma_1 * x) / n_k[1]
    mu[2] <-  sum(gamma_2 * x) / n_k[2]
    sigma[1] <- sum(gamma_1 * (x - mu[1])^2) / n_k[1]
    sigma[2] <- sum(gamma_2 * (x - mu[2])^2) / n_k[2]
    pi[1] <- n_k[1] / N
    pi[2] <- 1 - pi[1]
    if(abs(log_likelihood(x, mu, sigma, pi) - old_log_likelihood) < 0.001){
      break
    }
  }

}
