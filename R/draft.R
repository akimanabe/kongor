dat <- sample1 %>% dplyr::pull(length)

# assume the age group are three

fit_three <- function(dat,
                      mu <- c(NULL, NULL, NULL),
                      sigma <- c(NULL, NULL, NULL),
                      ratio <- c(NULL, NULL, NULL)) {

  # Use universal initial parameters when nothing is given (NULL)
  ifelse(is.null(mu), c(10, 15, 20), mu)
  ifelse(is.null(sigma), c(1, 1, 1), sigma)
  ifelse(is.null(ratio), runif(3), ratio)
  ratio <- ratio / sum(ratio)

  tibble::as_tibble(dat) %>%
    dplyr::rename(value = Length) %>%
    dplyr::mutate(Frequency = Length / sum(Length)) %>%
    dplyr::mutate(
      Age_0 = rnorm(n = nrow(dat), mean = mu[1], sd= sigma[1]),
      Age_1 = rnorm(n = nrow(dat), mean = mu[2], sd= sigma[2]),
      Age_2 = rnorm(n = nrow(dat), mean = mu[3], sd= sigma[3]),
      Age_0 = Age_0 / sum(Age_0),
      Age_1 = Age_1 / sum(Age_1),
      Age_2 = Age_2 / sum(Age_2)
    )
}


foo <- tibble::tibble(Length = c(10, 11, 12, 13, 14, 15))

foo %>%
  dplyr::count()

  bar <-
    sample1 %>%
    dplyr::mutate(length = floor(length)) %>%
    dplyr::group_by(length) %>%
    dplyr::summarise(n = dplyr::n()) %>%
    dplyr::mutate(Freq = n / sum(n)) %>%
    print(n = 22)


freq_dat <- function(length) {
  assertthat::assert_that(is.vector(length),
                          msg = "Input data need to be a vector of length measurement")
}

