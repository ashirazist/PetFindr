context("test-pf_list_types")

if(file.exists("token.txt")) {
  token <- readLines("token.txt")
}

test_that("list breeds has input as expected", {
  skip_if_not(exists("token"))
  expect_error(pf_list_types(token= 123))
  df<-pf_list_types(token= token)
  expect_s3_class(df, "data.frame")
  expect_is(pf_list_types(token= token)[, 1], "data.frame")
  expect_is(pf_list_types(token= token)[, 1], "tbl_df")
  
  
})

