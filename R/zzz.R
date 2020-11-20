.onAttach <- function(libname, pkgname) {
  # ...
  packageStartupMessage("Welcome to ibb package!\nThis is an unofficial R package for IMM Open Data Portal.\nFor more information, you can visit https://data.ibb.gov.tr/en/")

  packageStartupMessage("You can set a global limit on number of returned queries\nwith IBB_QUERY_LIMIT. Example use Sys.setenv(IBB_QUERY_LIMIT=10)")
  # ...
}
