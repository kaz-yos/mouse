##' Shows WCR confidence interval for a \code{mouse_models} class object
##'
##' Shows within-cluster resampling confidence interval for a \code{mouse_models} class object, which is a list of model outputs.
##'
##'
##' @param object An object that has the \code{mouse_model} class to be analyzed for confidence interval.
##' @param ... For compatibility with generic. Ignored.
##' @return Matrix containing lower and upper bounds
##' @author Kazuki Yoshida
##' @seealso
##' \code{\link{mouse}}, \code{\link{with.mouse_data}}
##' @examples
##'
##' ## See examples for mouse and with.mouse_data
##'
##' @export
confint.mouse_models <- function(x, level = 0.95, ...) {
    confint(x = pool(x), level = level)
}
