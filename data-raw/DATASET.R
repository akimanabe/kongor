# Sampledata

set.seed(5)
age1 <- tibble::tibble(age = 1, length = rnorm(1000, 15, 1.5))
age2 <- tibble::tibble(age = 2, length = rnorm(700,  20, 1.8))
age3 <- tibble::tibble(age = 3, length = rnorm(300,  25, 2))
sample1 <- dplyr::bind_rows(age1, age2, age3) %>%
  dplyr::mutate(age = as.factor(age,levels = c("1", "2", "3")))

usethis::use_data(sample1, overwrite = TRUE)

set.seed(1)
age0 <- tibble::tibble(Age = 0, Length = rnorm(100, 15, 2))
age1 <- tibble::tibble(Age = 1, Length = rnorm(20, 20, 2))
age2 <- tibble::tibble(Age = 2, Length = rnorm(120, 25, 3))
age3 <- tibble::tibble(Age = 3, Length = rnorm(15, 30, 2.5))

sample2 <- dplyr::bind_rows(age0, age1, age2, age3) %>%
  dplyr::mutate(Age = factor(Age, levels = c("0", "1", "2", "3")))

usethis::use_data(sample2, overwrite = TRUE)
