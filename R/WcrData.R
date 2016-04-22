##' One-line description
##'
##' Short description
##'
##' @details detailed description
##'
##' @return An object of class \code{wcr_data}, which is a list of resampled datasets, each of which consists of independent data points.
##'
##' @references HOffman EB, SEN PK, Weinberg CR. (2001). Within-cluster resampling. \emph{Biometrika}, \bold{88}, 1121-1134.
##'
##' @author Kazuki Yoshida
##' @seealso
##' \code{\link{print.wcr_data}}
##' @examples
##'
##' ## Load
##' library(wcr)
##'
##' @export
WcrData <- function(data, cluster_id, Q) {
    ## Assess cluster sizes
    n_k_vec <- ClusterSizes(data = data, cluster_id = cluster_id)
    ## Resample IDs
    resample_id_df <- ResampleId(n_k_vec = n_k_vec, Q = Q)
    ## Create a list of resampled datasets
    out <- ResampleDatasets(data = data,
                            cluster_id = cluster_id,
                            resample_id_df = resample_id_df)
    ## Give class name
    class(out) <- "wcr_data"
    out
}
