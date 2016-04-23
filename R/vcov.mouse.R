##' Shows WCR variance covariance matrix for a \code{mouse} class object
##'
##' Shows within-cluster resampling variance covariance matrix for a \code{mouse} class object.
##'
##'
##' @param object An object that has the \code{mouse} class to be shown.
##' @param ... For compatibility with generic. Ignored.
##' @return Variance covariance matrix
##' @author Kazuki Yoshida
##' @seealso
##' \code{\link{mouse}}, \code{\link{with.mouse_data}}
##' @examples
##'
##' ## See examples for mouse and with.mouse_data
##'
##' @export
vcov.mouse <- function(x, ...) {
    x$vcov
}
