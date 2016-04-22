##' Shows WCR results for a \code{wcr_models} class object
##'
##' Shows within-cluster resampling results for a \code{wcr_models} class object, which is a list of model outputs.
##'
##'
##' @param object An object that has the \code{wcr_model} class to be analyzed for aggregated results.
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
print.wcr_models <- function(x, ...) {
    print(PoolWcr(x))
}
