#testing
install_github("oliviajhenry/SlidingWindow")
library(SlidingWindow)
library(ggplot2)


devtools::load_all()
test <- euclidean_norm("Olivia/Example_window.csv", c('x', 'y', 'z'))

euclidean_data <-test[, "euclidean_data", drop=FALSE]

threshold <- apply_sliding_window(threshold_filter, euclidean_data, 1000, 0.5)
test$mean <- threshold

binary <- apply_sliding_window(binary_filter, euclidean_data, 1000)
test$binary <- binary

#plot_wrapper(test, c('euclidean_data', 'mean', 'binary'))
plot_wrapper(test, c('euclidean_data', 'mean'))
