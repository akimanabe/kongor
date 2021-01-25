#' Create length distribution by age
#'
#' @param age age vector
#' @param n number of fishes for each age
#' @param mu mean size for each age
#' @param sd sd for each age
#'
#' @return tibble with length list
#' @export
mixgauss <-
  function(age, n, mu, sd){
    p <- tibble::tibble(age = age,
                        n = n,
                        mu = mu,
                        sd = sd)

    p %>%
      dplyr::select(-age) %>%
      dplyr::mutate(length = purrr::pmap(.,
                                       function(n, mu, sd){
                                         rnorm(n = n,
                                               mean = mu,
                                               sd = sd)
                                       })) %>%
      dplyr::bind_cols(p %>%
                         dplyr::select(age)) %>%
      dplyr::select(age, n, mu, sd, length) %>%
      tidyr::unnest(length)
  }
