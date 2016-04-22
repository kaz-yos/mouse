##' One-line description
##'
##' Short description
##'
##' @details detailed description
##' @param wcr_models wcr_models object to be aggregated.
##' @return An object of class \code{wcr}, which is a list of aggregated results.
##'
##' @references HOffman EB, SEN PK, Weinberg CR. (2001). Within-cluster resampling. \emph{Biometrika}, \bold{88}, 1121-1134.
##'
##' @author Kazuki Yoshida
##' @seealso
##' \code{\link{WcrData}}, \code{\link{with.wrc_data}}
##' @examples
##'
##' ## Load
##' library(wcr)
##'
##' @export
PoolWcr <- function(wcr_models) {
    ## Coefficients
    coefs <- lapply(wcr_models, coef) %>%
        do.call(rbind, .)
    ## Estimated vcov 3D array (3rd dimension is iterations)
    vcovs <- lapply(wcr_models, vcov) %>%
        simplify2array

    ## Mean coefficients
    mean_coef <- colMeans(coefs)

    ## Mean estimated vcov
    mean_vcov_within <- apply(vcovs, MARGIN = c(1,2), FUN = mean)

    ## Variability across iterations
    lst_coefs <- lapply(wcr_models, coef)
    lst_vcovs_across <- lapply(lst_coefs, function(coef_r) {
        coef_diff <- coef_r - mean_coef
        ## Outer product of deviation from mean coefs
        as.matrix(coef_diff) %*% t(as.matrix(coef_diff))
    })
    ## Average using denominator Q - 1
    sum_vcovs_across <- simplify2array(lst_vcovs_across) %>%
        apply(., MARGIN = c(1,2), FUN = "sum")
    mean_vcov_across <- sum_vcovs_across / (length(wcr_models) - 1)
    ## Final adjusted variability

    out <- list(Q = length(wcr_models),
                ## Call from first model
                formula = wcr_models[[1]]$call,
                coef = mean_coef,
                ## Substraction unlike multiple imputation
                vcov = mean_vcov_within - mean_vcov_across)

    class(out) <- "wcr"
    out
}
