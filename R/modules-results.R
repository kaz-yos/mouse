################################################################################
### Unexported modules for WCR result pooling
##
## Created on: 2016-04-22
## Author: Kazuki Yoshida
################################################################################

## Basic methods
coef.wcr <- function(x, ...) {
    x$coef
}

vcov.wcr <- function(x, ...) {
    x$vcov
}
