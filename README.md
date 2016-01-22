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


## Creating your package

There are a few ways to do this, the easiest is using devtools

```r
# change working directory to where you want the package
setwd('~/my_folder')
devtools::create('myNewPackage')
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

An example of a test for the `times_ten()` function would be in a file called `tests/testthat/test_times_ten.R` and contains:
```r
context("test times_ten")

test_that("times_ten works as expected",{
	expect_error(times_ten("string"))
	expect_error(times_ten())
	expect_output(times_ten(10), 100)
	expect_output(times_ten(-1), -10)
})
```

To test all the code in your package that you have writen tests for, the easiest way is `ctrl + shift + t` while in RStudio.

You can test the entire build of your package, using `devtools::check()`. This will not only run any tests you have written, but check your package is properly documented and built.


## Putting your package on github

If you have all your functions in a package, it's worthwhile putting it on github. Github allows you to install your package from any computer, and also lets you track any changes you have made to your code over time, giving you a complete history of whatever you have changed -- very useful if you break anything.

### Create a repo on github

Get a github account and create an empty repo. The best option is to name is whatever you named your package folder, in this case `myNewPackage`.
Take not of the

### Setting up git

You're in the deep end here.

[![git](/graphics/git.png)](https://xkcd.com/1597/)

- Get git and set up a username and email with:
```
git config --global user.name 'JoeBloggs'
git config --global user.email 'Jbloggs@ed.ac.uk'
```
Use the same email address and user-name as you signed up to github with to make things easier.


Initialise git in your package folder

```
cd ~/myNewPackage
git init
```

Add all your files to push to github

```
git add .
git commit -m "my first commit"
```

Tell git where to push the files to (your Github repository you just made)

```
git remote add origin https://github.com/JoeBloggs/myNewPackage.git
```

Push all your files to github

```
git push -u origin master
```

Then check github.com to see if your files are there.

### Adding changes to your package

Say you made some changes to your code, to add that to your github repository:

```
git add updated_function.R 		# or whatever the file you want to add is called
git commit -m "made this function better"
git push origin master
```

### Getting your package from github

```r
devtools::install_github('JoeBlogs/myNewPackage')
```

## Automated testing

It's possible to automatically test your code/package every time you push any changes to github.

For this I use travis-ci, which requires you do add a `.travis.yml` file to your package. Then every time your package changes travis will check the package still builds, run any tests you wrote with `testthat` and send you an email if you broke anything.

You can also check how well you have tested your code with `codecov`.