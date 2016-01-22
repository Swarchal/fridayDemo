#' square root minus 1
#'
#' Given a number, this function will take the find the square root minus one
#'
#' @param x number
#' @return out number
#' @export
#'
#' @examples
#' vals <- rnorm(10)
#' sqrt_minus_one(vals)



sqrt_minus_one <- function(x){
  out <- sqrt(x) - 1
  return(out)
}
