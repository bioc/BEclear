testthat::context("Testing the gradient descent for a multiple epochs")

testthat::test_that("quadratic D matrix, only integer values given",{
    
    res1<-runGradientDescent(L0r10= matrix(c(1,2)), R0r10= t(matrix(c(3,4))), 
                  D = matrix(c(1,1,1,1), nrow = 2),
                  lambda = 0.2, is = c(1,2,1,2), js = c(1,1,2,2), 
                  nnzis = c(2,2), nnzjs = c(2,2), gamma = 0.01, n=2, m=2, r=1,
                  epochs = 5)
    
    testthat::expect_equal(res1$L, matrix(c(0.347, 0.393)), tolerance = .001)
    testthat::expect_equal(res1$R, t(matrix(c(2.61, 3.43))), tolerance = .001)
}
)

testthat::test_that("long D matrix, only integer values given",{
    
    res1<-runGradientDescent(L0r10 = matrix(c(5,6)), R0r10 = t(matrix(c(7,4,8))), 
                  D = matrix(c(7,5,3,1,3,4), nrow = 2),
                  lambda = 0.2, is = c(1,2,1,2), js = c(1,1,2,2), 
                  nnzis = c(2,2), nnzjs = c(2,2), gamma = 0.01, n=2, m=2, r=1,
                  epochs = 5)
    
    testthat::expect_equal(res1$L, matrix(c(-0.448, -1.109)), tolerance = .001)
    testthat::expect_equal(res1$R, t(matrix(c(-0.551, -0.530, 8.000))), tolerance = .001)
}
)

testthat::test_that("wide D matrix, only integer values given",{
    
    res1<-runGradientDescent(L0r10 = matrix(c(5,1,2)), R0r10 = t(matrix(c(3,3))), 
                  D = matrix(c(5,6,10,11,3,1), nrow = 3),
                  lambda = 0.2, is = c(1,2,1,2), js = c(1,1,2,2), 
                  nnzis = c(2,2), nnzjs = c(2,2), gamma = 0.01, n=2, m=2, r=1,
                  epochs = 5)
    
    testthat::expect_equal(res1$L, matrix(c(3.88449 , 1.50, 2.00)), tolerance = .001)
    testthat::expect_equal(res1$R, t(matrix(c(1.69, 2.65))), tolerance = .001)
}
)