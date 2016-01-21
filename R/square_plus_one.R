#' add_one
#'
#' Adds 1 to each element of a vector
#'
#' @param x a numerical vector
#' @return out a numerical vector 
#'
#' @examples
#' vals <- seq(1, 10, 1)
#' add_one(vals)

square_plus_one <- function(x){
	out <- x^2 + 1
	return(out)
}