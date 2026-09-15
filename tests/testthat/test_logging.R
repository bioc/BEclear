
testthat::test_that("logging works when logger formats with sprintf", {
  ## Without glue installed, logger's default formatter is formatter_sprintf,
  ## which failed on "% of the data" in clearBEgenes() before 2.29.2.
  ## log_formatter() returns the formatter it replaces, restored afterwards
  previous <- logger::log_formatter(logger::formatter_sprintf)
  tryCatch({
    data <- matrix(c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6), nrow = 2,
                   dimnames = list(c("g1", "g2"), c("s1", "s2", "s3")))
    samples <- data.frame(sample_id = c("s1", "s2", "s3"),
                          batch_id = c("b1", "b1", "b2"))
    summary <- data.table(gene = "g1", batch_id = "b2", median = 0.3,
                          pvalue = 0.001)

    testthat::expect_no_error(cleared <- clearBEgenes(data, samples, summary))
    testthat::expect_true(is.na(cleared["g1", "s3"]))
    testthat::expect_no_error(countValuesToPredict(cleared))
  }, finally = logger::log_formatter(previous))
})
