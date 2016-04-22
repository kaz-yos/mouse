##' Facilitate analyzing \code{wcr_data} class objects
##'
##' \code{with} method for the \code{wcr_data} class objects created by \code{\link{WcrData}} function.
##'
##' @param x Object returned by \code{\link{WcrData}} function.
##' @param expr Some analysis function invocation. Variable in the resampled dataset can be directly called, thus, no need to fill in the \code{data} argument.
##' @param ... For compatibility with generic. Ignored.
##'
##' @return An object with class \code{wcr_models}, which is a list of model output objects.
##' @author Kazuki Yoshida
##' @seealso
##' \code{\link{WcrData}}
##' @examples
##'
##' ## See examples for ...
##'
##' @export
with.wcr_data <- function (data, expr, ...) {

    ## Taken from mice::with.mids()

    ## Check data format
    if (!is.wcr_data(data)) {
        stop("The data must have class wcr_data")
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

    class(lstOut) <- "wcr_models"
    lstOut
}
