##' One-line description
##'
##' Short description
##'
##' @details detailed description
##' @param mouse_models mouse_models object to be aggregated.
##' @return An object of class \code{mouse}, which is a list of aggregated results.
##'
##' @references HOffman EB, SEN PK, Weinberg CR. (2001). Within-cluster resampling. \emph{Biometrika}, \bold{88}, 1121-1134.
##'
##' @author Kazuki Yoshida
##' @seealso
##' \code{\link{mouse}}, \code{\link{with.mouse_data}}
##' @examples
##'
##' ## Load
##' library(mouse)
##'
##' @export
pool <- function(mouse_models) {
    ## Coefficients
    coefs <- lapply(mouse_models, coef) %>%
        do.call(rbind, .)
    ## Estimated vcov 3D array (3rd dimension is iterations)
    vcovs <- lapply(mouse_models, vcov) %>%
        simplify2array

    ## Mean coefficients
    mean_coef <- colMeans(coefs)

    ## Mean estimated vcov
    mean_vcov_within <- apply(vcovs, MARGIN = c(1,2), FUN = mean)

    ## Variability across iterations
    lst_coefs <- lapply(mouse_models, coef)
    lst_vcovs_across <- lapply(lst_coefs, function(coef_r) {
        coef_diff <- coef_r - mean_coef
        ## Outer product of deviation from mean coefs
        as.matrix(coef_diff) %*% t(as.matrix(coef_diff))
    })
    ## Average using denominator Q - 1
    sum_vcovs_across <- simplify2array(lst_vcovs_across) %>%
        apply(., MARGIN = c(1,2), FUN = "sum")
    mean_vcov_across <- sum_vcovs_across / (length(mouse_models) - 1)
    ## Final adjusted variability

    out <- list(Q = length(mouse_models),
                ## Call from first model
                formula = mouse_models[[1]]$call,
                coef = mean_coef,
                ## Substraction unlike multiple imputation
                vcov = mean_vcov_within - mean_vcov_across)

    class(out) <- "mouse"
    out
}
