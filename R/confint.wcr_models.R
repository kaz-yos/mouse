##' Shows WCR confidence interval for a \code{wcr_models} class object
##'
##' Shows within-cluster resampling confidence interval for a \code{wcr_models} class object, which is a list of model outputs.
##'
##'
##' @param object An object that has the \code{wcr_model} class to be analyzed for confidence interval.
##' @param ... For compatibility with generic. Ignored.
##' @return Matrix containing lower and upper bounds
##' @author Kazuki Yoshida
##' @seealso
##' \code{\link{WcrData}}, \code{\link{with.wrc_data}}
##' @examples
##'
##' ## See examples for WcrData and with.wrc_data
##'
##' @export
confint.wcr_models <- function(x, level = 0.95, ...) {
    confint(x = PoolWcr(x), level = level)
}
