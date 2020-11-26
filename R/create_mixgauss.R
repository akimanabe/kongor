#' Create length distribution by age
#'
#' @param age age vector
#' @param n number of fishes for each age
#' @param mu mean size for each age
#' @param sd sd for each age
#'
#' @return tibble with length list
#' @export
#'
#' @examples
#' \dontrun{
#' age <- c(1, 2)
#' n   <- c(10, 10)
#' mu  <- c(30, 50)
#' sd  <- c(3, 5)
#' create_mixgauss(age = age, n = n, mu = mu, sd = sd)
#' }
create_mixgauss <-
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
