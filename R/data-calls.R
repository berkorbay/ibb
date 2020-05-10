#'@title Get ISPARK Locations
#'@description 
#'@param params List of parameters
#'@export
#'@examples
#' \dontrun{
#' get_ispark_locations(params=list(limit=5))
#' }
get_ispark_locations <- function(params=list(limit=Sys.getenv("IBB_QUERY_LIMIT"))){

  get_data_frame_ibb(resource_id="c3eb0d72-1ce4-4983-a3a8-6b0b4b19fcb9",limit=params$limit)
}

#'@title WATER OUTAGE COMPLAINTS AND RESPONSE NUMBERS BY DISTRICT IN 2019
#'@description Contains information on the number of complaints and responses to water outages and responses from all districts and neighborhoods across Istanbul in 2019, from the Istanbul Water and Sewerage Administration (İSKİ) call center.
#'@param params List of parameters
#'@examples
#' \dontrun{
#' get_iski_call_center_complaint_stats(params=list(limit=5))
#' }
#'@export
get_iski_call_center_complaint_stats <- function(params=list(limit=Sys.getenv("IBB_QUERY_LIMIT"))){

  get_data_frame_ibb(resource_id="4b2fc348-5c36-4eb7-b764-284887c559fc",limit=params$limit)
}

#'@title Park, Garden and Green Area Data for 2019
#'@description Includes the number of parks, number of trees maintained, number of sports grounds, length of sports fields, number of playgrounds, number of trees planted, and type of green areas in Istanbul in 2019.
#'@param params List of parameters
#'@examples
#' \dontrun{
#' get_park_garden_green_area_data(params=list(limit=5))
#' }
#'@export
get_park_garden_green_area_data <- function(params=list(limit=Sys.getenv("IBB_QUERY_LIMIT"))){
  get_data_frame_ibb(resource_id="1d9762dc-b3ea-43f1-a46b-2eb0884d26e1",limit=params$limit)
}

#'@title Environmental Monitoring and Control Data Based on Location in 2020
#'@description It contains environmental monitoring and control data with 13 parameters, measured in 15-minute periods in 38 pre-determined locations in Istanbul for 2020.
#'@param params List of parameters
#'@examples
#' \dontrun{
#' get_environmental_monitoring_and_control_data(params=list(limit=5))
#' }
#'@export
get_environmental_monitoring_and_control_data <- function(params=list(limit=Sys.getenv("IBB_QUERY_LIMIT"))){
  get_data_frame_ibb(resource_id="54bcaea5-e215-44f2-9319-0d6ae5913661",limit=params$limit)
}

# #'@title VACCINATED ANIMALS
# #'@description Contains data on animals vaccinated from December 2019 in Istanbul
# #'@export
# get_vaccinated_animals <- function(params=list(limit=Sys.getenv("IBB_QUERY_LIMIT"))){
#   print("NOT YET READY")
#   # data_list <- xml2::read_xml("https://data.ibb.gov.tr/en/dataset/9f4de8dc-1456-4850-b91f-9d8d446019d4/resource/8ecf3a82-223a-4724-8e67-bc3967f74dcc/download/asilananhayvanlar.xml")
#   # return_data <- data_list %>% xml2::xml_children() %>% xml2::as_list() %>% jsonlite::toJSON() %>% jsonlite::fromJSON(.,flatten=TRUE) %>% as_tibble()
#   # return(return_data)
# }


#'@title ibbWiFi Daily Data Usage
#'@description Data set contains info about number of locations, number of subscribers, number of sessions, number of devices, data usage and usage duration.
#'@param params List of parameters
#'@export
get_ibb_wifi_daily_data_usage <- function(params=list(limit=Sys.getenv("IBB_QUERY_LIMIT"))){
  get_data_frame_ibb(resource_id="a9ddefb0-e754-456e-b1a0-6bfc033eeb79",limit=params$limit)
}

#'@title ibbWiFi Daily New Subscribers
#'@description Data set of new subscribers
#'@param params List of parameters
#'@export
get_ibb_wifi_daily_new_subscribers <- function(params=list(limit=Sys.getenv("IBB_QUERY_LIMIT"))){
  get_data_frame_ibb(resource_id="06529f77-53f2-47bd-a13b-33d6097b463a",limit=params$limit)
}

#'@title ibbWiFi New Subscribers by Location
#'@description Data set of new subscribers by subscription location
#'@param params List of parameters
#'@export
get_ibb_wifi_new_subscribers_by_location <- function(params=list(limit=Sys.getenv("IBB_QUERY_LIMIT"))){
  get_data_frame_ibb(resource_id="99d1edb6-a889-4e69-be7b-21a3f90101f1",limit=params$limit)
}

# #'@title ibbWiFi Data Usage by Location Group
# #'@description Data set of ibbWiFi data usage by location group
# #'@param params List of parameters
# #'@export
# get_ <- function(params=list(limit=Sys.getenv("IBB_QUERY_LIMIT"))){
#   get_data_frame_ibb(resource_id="04360f55-d9c3-4a85-b8d4-de60b333c571",limit=params$limit)
# }



######
### TEMPLATE
######

# #'@title 
# #'@description 
# #'@param params List of parameters
# #'@export
# get_ <- function(params=list(limit=Sys.getenv("IBB_QUERY_LIMIT"))){
#   get_data_frame_ibb(resource_id="",limit=params$limit)
# }

