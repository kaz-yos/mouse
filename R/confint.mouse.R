##' Shows WCR confidence intervals for a \code{mouse} class object
##'
##' Shows within-cluster resampling confidence intervals for a \code{mouse} class object, which is a list of model outputs.
##'
##'
##' @param object An object that has the \code{mouse} class to be shown.
##' @param ... For compatibility with generic. Ignored.
##' @return None. Results are printed.
##' @author Kazuki Yoshida
##' @seealso
##' \code{\link{mouse}}, \code{\link{with.mouse_data}}
##' @examples
##'
##' ## See examples for mouse and with.mouse_data
##'
##' @export
confint.mouse <- function(x, level = 0.95) {
    alpha <- 1 - level
    lower <- coef(x) - qnorm(p = level + alpha / 2) * sqrt(diag(vcov(x)))
    upper <- coef(x) + qnorm(p = level + alpha / 2) * sqrt(diag(vcov(x)))
    data.frame(lower = lower,
               upper = upper)
}
