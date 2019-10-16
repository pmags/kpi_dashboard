
# ======================================================================================= #
# Script Name : functions used during the project                                                                                           
# Purpose     :                                                                      
# Args        : 
# Date        : Fri Oct 04 17:14:13 2019   
# Author      : Pedro Magalhães                                                
# Email       : pedro.magalhaes@mosaic.pt                                           
# ======================================================================================= #

# ======================================================================================= #
# formats ----                                         
# ======================================================================================= #

# converts numbers to thousand for plots
ks <- function(x) {
  
  scales::number_format(accuracy = 1, scale = 1/1000, suffix = "k",big.mark = ".",decimal.mark = ",") (x)

}

# converts numbers to x times for plots
xs <- function(x) {
  
  scales::number_format(accuracy = 0.1, suffix = "x",big.mark = ".",decimal.mark = ",") (x)
  
}

# ======================================================================================= #
# plots ----                                         
# ======================================================================================= #

# Grammar of graphics: data, aesthetics(tell us which scales), Geometries, facets, Statistics, coordinates, theme 