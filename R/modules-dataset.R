################################################################################
### Unexported modules for dataset generation
##
## Created on: 2016-04-22
## Author: Kazuki Yoshida
################################################################################

## Function to assess cluster sizes
ClusterSizes <- function(data, cluster_id) {
    table(data[,cluster_id])
}


## Function to resample within-cluster ID
## Feed a vector of n_k's from ClusterSizes()
ResampleId <- function(n_k_vec, Q) {
    ## Loop over cluster sizes
    lapply(n_k_vec, function(n_k) {
        sample(x = seq(from = 1, to = n_k, by = 1),
               size = Q, replace = TRUE)
    }) %>%
        do.call(rbind, .) %>%
        as.data.frame
}


## Function to create a resampled indpendent dataset using single ID vector
ResampleDataset <- function(data, cluster_id, resample_id_vec) {
    ## Split by cluster ID
    lst_data <- split(data, data[,cluster_id])
    ## Pick appropriate row within each cluster
    lapply(seq_along(resample_id_vec), function(k) {
        ## Get selected row number for cluster k
        within_cluster_id <- resample_id_vec[k]
        ## Get data frame for cluster k
        df <- lst_data[[k]]
        ## Pick selected observation
        df[within_cluster_id,, drop = FALSE]
    }) %>% do.call(rbind, .)
}


## Function to create a list of Q resampled independence datasets
ResampleDatasets <- function(data, cluster_id, resample_id_df) {
    lapply(resample_id_df,
           ## Leave resample_id_vec unfilled
           ResampleDataset,
           data = data,
           cluster_id = cluster_id)
}


## Function to check for mouse_data class
is.mouse_data <- function(x, ...) {
    any(class(x) %in% "mouse_data")
}
