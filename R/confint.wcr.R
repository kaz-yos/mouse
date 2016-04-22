##' Shows WCR confidence intervals for a \code{wcr} class object
##'
##' Shows within-cluster resampling confidence intervals for a \code{wcr} class object, which is a list of model outputs.
##'
##'
##' @param object An object that has the \code{wcr} class to be shown.
##' @param ... For compatibility with generic. Ignored.
##' @return None. Results are printed.
##' @author Kazuki Yoshida
##' @seealso
##' \code{\link{WcrData}}, \code{\link{with.wrc_data}}
##' @examples
##'
##' ## See examples for WcrData and with.wrc_data
##'
##' @export
confint.wcr <- function(x, level = 0.95) {
    alpha <- 1 - level
    lower <- coef(x) - qnorm(p = alpha / 2) * sqrt(diag(vcov(x)))
    upper <- coef(x) + qnorm(p = alpha / 2) * sqrt(diag(vcov(x)))
    data.frame(lower = lower,
               upper = upper)
}
