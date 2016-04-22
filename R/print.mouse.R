##' Shows WCR results for a \code{mouse} class object
##'
##' Shows within-cluster resampling results for a \code{mouse} class object, which is a list of model outputs.
##'
##'
##' @param object An object that has the \code{mouse} class to be shown.
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
print.mouse <- function(x, ...) {
    cat("Within-cluster resampling results based on ", x$Q, "iterations\n")

    cat("\nModel formula\n")
    print(x$formula)

    cat("\nEffect estimates\n")
    ## Construct fixed effects table
    resTab <- cbind(coef(x),
                    sqrt(diag(vcov(x))))
    resTab <- cbind(resTab,
                    resTab[,1] / resTab[,2])
    resTab <- cbind(resTab,
                    2 * pnorm(abs(resTab[,3]), lower.tail = FALSE))
    colnames(resTab) <- c("Estimate", "Std. Error", "z value", "Pr(|z|>)")
    print(resTab)
}
