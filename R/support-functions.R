#' @title Change Language to English
#' @description Changes API language to English
#' @export
change_language_to_english <- function() {
  Sys.setenv(IBB_LANGUAGE = "en")
}

#' @title Set Query Limit
#' @description Sets maximum number of returned results
#' @param limit Limit of the maximum results
#' @export
set_query_limit <- function(limit = 100) {
  Sys.setenv(IBB_QUERY_LIMIT = limit)
}

#' @title Get All Data Sources
#' @param get_all_info If TRUE return the whole list, otherwise just return the required result data frame.
#' @export
get_all_data_sources <- function(get_all_info = FALSE) {
  the_result <- jsonlite::fromJSON(call_data_ibb("package_list"))

  if (get_all_info) {
    return(the_result)
  }

  return(tibble::as_tibble(the_result$result))
}

#' @title Get Info on a Data Source
#' @param package_id Package ID taken from the package list. Run get_all_detailed_info to see the available IDs
#' @param get_all_info If TRUE return the whole list, otherwise just return the required result data frame.
#' @examples
#' \dontrun{
#' get_detailed_info_on_data_source("594ca91d-0c71-41da-b50a-c7cd30fab67a")
#' }
#' @export
get_detailed_info_on_data_source <- function(package_id, get_all_info = FALSE) {
  the_result <- jsonlite::fromJSON(call_data_ibb(paste0("package_show?id=", package_id)))
  if (get_all_info) {
    return(the_result)
  }

  return(tibble::as_tibble(the_result$result$resources))
}

#' @title Get Info on All Data Sources
#' @param verbose If TRUE, it prints the track of the data being imported.
#' @export
get_all_detailed_info <- function(verbose = FALSE) {
  sources_vec <- get_all_data_sources() %>%
    unlist()
  all_resources_info <- tibble::tibble()
  for (i in seq_along(sources_vec)) {
    if (verbose == TRUE) print(paste0("Getting info on: ", sources_vec[i], " Package ", i, "/", length(sources_vec)))
    resource_df <- get_detailed_info_on_data_source(package_id = sources_vec[i])
    if (!is.null(resource_df)) {
      all_resources_info <- resource_df %>%
        dplyr::mutate(package_name = sources_vec[i]) %>%
        dplyr::bind_rows(all_resources_info)
    } else {
      print("This package id has no defined resources.")
    }
  }

  tibble::as_tibble(all_resources_info) %>%
    dplyr::select(
      .data$resource_id,
      .data$package_id,
      tidyselect::everything()
    ) %>%
    return()
}
