
# Contrasts

## Installation

You can install the development version of Contrasts from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("anhsmith/Contrasts")
```

## Example

``` r
library(Contrasts)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

Make a factor `x` with three levels and uneven sample sizes.

``` r
x = factor(rep(letters[1:3], times=4:6))
```

Make the contrasts.

``` r
make_weightzero_contrasts(x)
#>        b          c
#> 1  -0.25 -0.2500000
#> 2  -0.25 -0.2500000
#> 3  -0.25 -0.2500000
#> 4  -0.25 -0.2500000
#> 5   0.20  0.0000000
#> 6   0.20  0.0000000
#> 7   0.20  0.0000000
#> 8   0.20  0.0000000
#> 9   0.20  0.0000000
#> 10  0.00  0.1666667
#> 11  0.00  0.1666667
#> 12  0.00  0.1666667
#> 13  0.00  0.1666667
#> 14  0.00  0.1666667
#> 15  0.00  0.1666667
```

Take factor `x`, along with a factor `y_in_x` nested in `x`, and make
contrasts for both.

``` r
y_in_x = factor(paste0(x,c(1,1,2,2,1,1,2,2,3,1,2,2,2,3,3)))

bind_cols(
   x=x, y_in_x=y_in_x,
   make_weightzero_contrasts(x),
   make_weightzero_nested_contrasts(y_in_x, x)
 )
#> # A tibble: 15 × 9
#>    x     y_in_x     b      c    a2    b2    b3     c2    c3
#>    <fct> <fct>  <dbl>  <dbl> <dbl> <dbl> <dbl>  <dbl> <dbl>
#>  1 a     a1     -0.25 -0.25   -0.5   0     0    0       0  
#>  2 a     a1     -0.25 -0.25   -0.5   0     0    0       0  
#>  3 a     a2     -0.25 -0.25    0.5   0     0    0       0  
#>  4 a     a2     -0.25 -0.25    0.5   0     0    0       0  
#>  5 b     b1      0.2   0       0    -0.5  -0.5  0       0  
#>  6 b     b1      0.2   0       0    -0.5  -0.5  0       0  
#>  7 b     b2      0.2   0       0     0.5   0    0       0  
#>  8 b     b2      0.2   0       0     0.5   0    0       0  
#>  9 b     b3      0.2   0       0     0     1    0       0  
#> 10 c     c1      0     0.167   0     0     0   -1      -1  
#> 11 c     c2      0     0.167   0     0     0    0.333   0  
#> 12 c     c2      0     0.167   0     0     0    0.333   0  
#> 13 c     c2      0     0.167   0     0     0    0.333   0  
#> 14 c     c3      0     0.167   0     0     0    0       0.5
#> 15 c     c3      0     0.167   0     0     0    0       0.5
```
