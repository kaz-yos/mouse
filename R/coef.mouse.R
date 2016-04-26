##' Shows WCR coefficient vector for a \code{mouse} class object
##'
##' Shows within-cluster resampling coefficient vector for a \code{mouse} class object.
##'
##'
##' @param object An object that has the \code{mouse} class to be shown.
##' @param ... For compatibility with generic. Ignored.
##' @return Coefficient vector
##' @author Kazuki Yoshida
##' @seealso
##' \code{\link{mouse}}, \code{\link{with.mouse_data}}
##' @examples
##'
##' ## See examples for mouse and with.mouse_data
##'
##' @export
coef.mouse <- function(x, ...) {
    x$coef
}
