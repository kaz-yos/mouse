##' Shows all results in a \code{mouse_data} class object
##'
##' Shows all model ouputs in a \code{mouse_data} class object, which is a list of model outputs.
##'
##'
##' @param object An object that has the \code{mouse_data} class to be shown.
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
summary.mouse_models <- function(x, ...) {
    print.default(x)
}

