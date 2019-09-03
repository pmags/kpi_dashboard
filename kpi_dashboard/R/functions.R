
### Scripts with functions and code used on dashboard


# ks_function  ----- 
# converts numbers to thousand for plots

ks <- function(x) {
  
  scales::number_format(accuracy = 1, scale = 1/1000, suffix = "k",big.mark = ".",decimal.mark = ",") (x)

}