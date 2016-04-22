##' Facilitate analyzing \code{mouse_data} class objects
##'
##' \code{with} method for the \code{mouse_data} class objects created by \code{\link{mouse}} function.
##'
##' @param x Object returned by \code{\link{mouse}} function.
##' @param expr Some analysis function invocation. Variable in the resampled dataset can be directly called, thus, no need to fill in the \code{data} argument.
##' @param ... For compatibility with generic. Ignored.
##'
##' @return An object with class \code{mouse_models}, which is a list of model output objects.
##' @author Kazuki Yoshida
##' @seealso
##' \code{\link{mouse}}
##' @examples
##'
##' ## See examples for ...
##'
##' @export
with.mouse_data <- function (data, expr, ...) {

    ## Taken from mice::with.mids()

    ## Check data format
    if (!is.mouse_data(data)) {
        stop("The data must have class mouse_data")
    }

    ## Capture expression as a call before eval
    expr <- substitute(expr)

    ## Loop over data invoking model expression
    lstOut <- lapply(data, function(df) {
        ## eval within df environment
        out <- eval(expr = expr, envir = df,
                    enclos = parent.frame())

        ## If it is still a call, eval again
        if (is.expression(out)) {
            out <- eval(expr = out, envir = df,
                        enclos = parent.frame())
        }
        out
    })

    class(lstOut) <- "mouse_models"
    lstOut
}
