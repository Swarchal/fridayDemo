context("Hello is working as expected")

test_that("hello() works as expected",{
  expect_output(hello(), 'Hello world')
  expect_error(hello(argument))
})
