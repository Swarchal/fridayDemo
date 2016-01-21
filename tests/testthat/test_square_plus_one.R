context("test square_plus_one")

test_that("square_plus_one returns expected answers",{
  x <- c(1, 2, 3)
  expect_equal(square_plus_one(x), c(2, 5, 10))

#   x <- rep(c(TRUE, FALSE), 5)
#   expect_error(square_plus_one(x))
})
