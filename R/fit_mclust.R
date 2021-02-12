fit_mclust <-
  function(dat) {
  assertthat::assert_that(is.vector(dat), msg = "Input must be a vector")
  mclust::Mclust(dat)
}
