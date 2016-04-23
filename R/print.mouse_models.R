##' Shows WCR results for a \code{mouse_models} class object
##'
##' Shows within-cluster resampling results for a \code{mouse_models} class object, which is a list of model outputs.
##'
##'
##' @param object An object that has the \code{mouse_model} class to be analyzed for aggregated results.
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
print.mouse_models <- function(x, ...) {
    Q <- length(x)
    cat("Within-cluster resampling model fits based on", Q, "iterations\n")
    cat("Use pool() to aggregate results\n")
    cat("Each model fit can be accessed as list elements\n")
    formula <- x[[1]]$call
    cat("\nModel formula\n")
    print(x$formula)
}
