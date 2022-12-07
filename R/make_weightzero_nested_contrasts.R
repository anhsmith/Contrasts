#' Make weighted sum-to-zero contrasts for a factor y_in_x nested in x
#'
#' @param y_in_x A factor that is nested in x
#' @param x A factor in which y_in_x is nested
#'
#' @import dplyr magrittr tibble tidyr
#' @return \code{make_weightzero_nested_contrasts}
#' @export
#'
#' @examples
#' x = factor(rep(letters[1:3], times=4:6))
#' y_in_x = factor(paste0(x,c(1,1,2,2,1,1,2,2,3,1,2,2,2,3,3)))
#'
#' dplyr::bind_cols(
#'   x=x, y_in_x=y_in_x,
#'   make_weightzero_contrasts(x),
#'   make_weightzero_nested_contrasts(y_in_x, x)
#' )
make_weightzero_nested_contrasts <- function(y_in_x, x) {
data.frame(x,y_in_x) %>%
  group_by(x) %>%
  group_modify(~ make_weightzero_contrasts(.x$y_in_x)) %>%
  replace(is.na(.), 0) %>%
  ungroup() %>%
  select(-x)
}
