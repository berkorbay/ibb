#' @title Fundamental Call Function
#' @description Fundamental call function of (almost) all IBB Open Data Portal (exceptions apply)
#' @param call_phrase Suffix of the call url.
#' @param root_url Root of the calls.
call_data_ibb <- function(call_phrase = "", root_url = "https://data.ibb.gov.tr/api/3/action/") {
  if (Sys.getenv("IBB_LANGUAGE") == "en") {
    root_url <- gsub("/api/", "/en/api/", root_url)
  }

  ibb_query_url <- paste0(root_url, "/", call_phrase)

  # json_query_response <- jsonlite::fromJSON(ibb_query_url)
  # return_df <- json_query_response$result$records %>% rename_all(~gsub("^_","",.)) %>% rename_all(~gsub(" |\\(|\\)|/","_",.)) %>% tbl_df()
  #
  # return(return_df)

  the_request <- httr::GET(ibb_query_url, httr::add_headers(accept = "application/json"))

  the_response <- httr::content(the_request, "text", encoding = "UTF-8")

  return(the_response)
}

#' @title Get Data Frame from Resource ID Value
#' @description Given a data resource ID, this function returns the data frame.
#' @param resource_id Resource ID of the wanted data set. Run get_all_detailed_info to see the available IDs
#' @param limit Maximum number of records
#' @param return_json If TRUE, return a json string instead of a data frame.
#'
#' @examples
#' \dontrun{
#' get_data_frame_ibb("99d1edb6-a889-4e69-be7b-21a3f90101f1")
#' }
#'
#' @export
get_data_frame_ibb <- function(resource_id, limit = "", return_json = FALSE) {
  the_response <- call_data_ibb(paste0("datastore_search?resource_id=", resource_id, ifelse(limit == "", "", paste0("&limit=", limit))))

  if (return_json) {
    return(the_response)
  }

  json_query_response <- jsonlite::fromJSON(the_response)
  return_df <- json_query_response$result$records %>%
    dplyr::rename_with(~ gsub("^_", "", .)) %>%
    dplyr::rename_with(~ gsub(" |\\(|\\)|/|-", "_", .)) %>%
    dplyr::rename_with(~ gsub("^_|_+$", "", .)) %>%
    tibble::as_tibble()

  return(return_df)
}

# #' @title Query IBB Data with optional sql filter specialties
# query_ibb_data <- function(resource_id,column_params=NULL,where_params=NULL,limit_params=NULL){

#   sql_start_phrase <- "datastore_search_sql?sql=SELECT"
#   sql_phrase <- paste0(sql_start_phrase)
#   if(is.null(column_params)){
#     sql_phrase <- paste0(sql_phrase," * ")
#   }else{
#     sql_phrase <- paste0(sql_phrase," ",column_params)
#   }

#   if(!is.null(where_params)){
#     sql_phrase <- paste0(sql_phrase," WHERE ",column_params)
#   }


# }
