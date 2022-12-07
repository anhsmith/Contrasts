#' Make weighted sum-to-zero contrasts for a single factor
#'
#' @param x A vector from which to to make contrasts. Can be character or factor.
#'
#' @return \code{make_weightzero_contrasts}
#' @export
#'
#' @examples
#' x <- factor(rep(letters[1:3], times=4:6))
#' make_weightzero_contrasts(x)
make_weightzero_contrasts <- function(x) {
  x = as.character(x)
  n <- length(x)
  levs <- unique(x)
  nlevs <- length(levs)
  cont <- array(0, c(n,nlevs-1), dimnames=list(NULL,levs[2:nlevs]))
  cont[x == levs[1]] <- -1 / sum(x == levs[1])
  for(i in levs[2:nlevs]) cont[x == i,i] <- 1 / sum(x == i)
  cont <- data.frame(cont)
  return(cont)
}
