#' Convert length data to frequency data
#'
#' @param dat a numerical vector of indiv length measurement
#'
#' @return frequency in tibble
#' @export
#'
#' @examples
freq_length <-
  function(dat) {
    assertthat::assert_that(
      is.vector(dat),
      msg = "Input data is a vector with length data or count data")

    dat %>%
      tibble::tibble(length = .) %>%
      dplyr::mutate(length = floor(length)) %>%
      dplyr::group_by(length) %>%
      dplyr::summarize(n = dplyr::n()) %>%
      dplyr::mutate(Freq = n / sum(n))
  }

#' Convert count data to frequency data
#'
#' @param dat a numerical vector of length count
#'
#' @return frequency in tibble
#' @export
#'
#' @examples
freq_count <-
  function(dat) {
    assertthat::assert_that(
      is.vector(dat),
      msg = "Input data is a vector with length data or count data")

    dat %>%
      tibble::tibble(count = .) %>%
      dplyr::mutate(Freq = count / sum(count))

  }
