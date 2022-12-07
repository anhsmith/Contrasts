# Generate data
x = factor(rep(letters[1:3], times=4:6))
y_in_x = factor(paste0(x,c(1,1,2,2,1,1,2,2,3,1,2,2,2,3,3)))

# Save data
usethis::use_data(x, y_in_x, overwrite = TRUE)
