context("geocode")

test_that("geocode with google api", {
  coords <- geocode('Tsinghua University', api = 'google')
  expect_true(abs(coords$lat - 39.9984) < 5e-3)
  expect_true(abs(coords$lng - 116.3203) < 5e-3)
})