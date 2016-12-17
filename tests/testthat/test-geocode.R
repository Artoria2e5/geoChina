context("geocode")

test_that("geocode with google api", {
  coords <- geocode('Beijing Railway Station', api = 'google')
  expect_true(abs(coords$lat - 39.90358) < 5e-3)
  expect_true(abs(coords$lng - 116.421) < 5e-3)
})