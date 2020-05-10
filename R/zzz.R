.onAttach <- function(libname, pkgname)
{
    # ...
    packageStartupMessage("Welcome to ibb package! This is an unofficial R package for Istanbul Metropolitan Municipality Open Data Portal. For more information, you can visit https://data.ibb.gov.tr/en/")

    packageStartupMessage("You can set a global limit on number of returned queries with IBB_QUERY_LIMIT. Example use Sys.setenv(IBB_QUERY_LIMIT=10)")
    # ...
}
