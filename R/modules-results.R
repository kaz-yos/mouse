################################################################################
### Unexported modules for WCR result pooling
##
## Created on: 2016-04-22
## Author: Kazuki Yoshida
################################################################################

## Basic methods
coef.mouse <- function(x, ...) {
    x$coef
}

vcov.mouse <- function(x, ...) {
    x$vcov
}
