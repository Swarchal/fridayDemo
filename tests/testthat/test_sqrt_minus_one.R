context("test sqrt_minus_1")

test_that("returns expected values",{
  expect_equal(sqrt_minus_one(25), 4)
  expect_equal(sqrt_minus_one(1), 0)
  expect_equal(sqrt_minus_one(2), 0.414, tolerance = 1e-3)
  expect_warning(sqrt_minus_one(-16))
})
