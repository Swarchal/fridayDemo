# Example Repository

## Good practises in R
Repo used for Friday demonstration.

## Very important
[![github](/graphics/github.png)](https://www.github.com)
[![devtools](/graphics/devtools.png)](https://www.rstudio.com/products/rpackages/devtools/)

## Pretty useful
[**testthat**](https://github.com/hadley/testthat)
[![Travis](/graphics/travis.jpeg)](https://www.travis.ci.org)
[![codecov](/graphics/codecov.png)](https://codecov.io/)


## Setting up your repository

There are a few ways to do this, the easiest is using devtools

```r
# change working directory to where you want the package
setwd('~/my_folder')
devtools::create('myNewPacakge')
```
This will create a folder called `myNewPackage` that contains everything you need to start an R package.

### Create test folder with devtools
```r
devtools::use_testthat()
```

This creates a folder within your package to store tests, and sets up the infrastructure for you.


### Write your function, and document with Roxygen
```r
#' Times a number by ten
#'
#' Given a number, this will times a number by 10. This also works with vectors.
#'
#' @param x number of vector of numbers
#' @return out output, which is input times ten
#' @export # writes to NAMESPACE for you
#' @examples
#' times_ten(10)

times_ten <- function(x){
	return(x * 10)
}
```

The bit at the top prefixed by `#'` lets you document your code within the source, and Roxygen will create the man documents automatically.
Alternatively you can write the documentation separately but it's a huge pain.

### Create docs automatically
```r
devtools::document()
```

This writes the man pages for you, from all the `#'` in your code.


### Write tests for your code
The tests go in the `tests/testthat` folder, and the files have to begin with `test`.

An example of a test for the `times_ten()` function would be:
```r
context("test times_ten")

test_that("times_ten works as expected",{
	expect_error(times_ten("string"))
	expect_error(times_ten())
	expect_output(times_ten(10), 100)
	expect_output(times_ten(-1), -10)
})
```