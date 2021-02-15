mu1 <- 13
mu2 <- 22
mu3 <- 25
sigma1 <- 1
sigma2 <- 1
sigma3 <- 1

mus <- c(mu1, mu2, mu3)
sds <- c(sigma1, sigma2, sigma3)

estim_3 <- function(dat, par) {
freq_length(sample1[,2]) %>%
  dplyr::mutate(age0 = dnorm(length$length, mean = par[1], sd = par[4]),
                age1 = dnorm(length$length, mean = par[2], sd = par[5]),
                age2 = dnorm(length$length, mean = par[3], sd = par[6])) %>%
  dplyr::mutate(dens = age0 + age1 + age2) %>%
  dplyr::mutate(residual = (Freq - dens)^2) %>%
  dplyr::pull(residual) %>%
  sum()
}

optim(par = c(13, 22, 25, 1, 1, 1), estim_3)
optim(par = c(13, 22, 25, 1, 1, 1), fn = estim_3)
