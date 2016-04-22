##' Shows all results in a \code{wcr_data} class object
##'
##' Shows all model ouputs in a \code{wcr_data} class object, which is a list of model outputs.
##'
##'
##' @param object An object that has the \code{wcr_data} class to be shown.
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
summary.wcr_models <- function(x, ...) {
    print.default(x)
}

