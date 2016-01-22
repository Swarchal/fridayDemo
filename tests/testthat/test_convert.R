context("sqrt_minus_one and square_plus_one convert from one to the other")

# this should fail!
test_that("convert vector from one to the other",{
  original_vals <- seq(1, 10)
  sq_p_1 <- square_plus_one(original_vals)
  rev_vals <- sqrt_minus_one(sq_p_1)
  test_equals(original_vals, rev_vals)
})
