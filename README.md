
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ibb

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/ibb)](https://CRAN.R-project.org/package=ibb)
[![R build
status](https://github.com/emraher/ibb/workflows/R-CMD-check/badge.svg)](https://github.com/emraher/ibb/actions)
[![Codecov test
coverage](https://codecov.io/gh/emraher/ibb/branch/master/graph/badge.svg)](https://codecov.io/gh/emraher/ibb?branch=master)
<!-- badges: end -->

The goal of ibb is to access [Istanbul Metropolitan Municipality’s Open
Data Portal](https://data.ibb.gov.tr/en/).

## Installation

You can install the released version of ibb from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("ibb")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("berkorbay/ibb")
```

## Usage and Examples

### All Data Sources

``` r
library(ibb)
#> Welcome to ibb package!
#> This is an unofficial R package for IMM Open Data Portal.
#> For more information, you can visit https://data.ibb.gov.tr/en/
#> You can set a global limit on number of returned queries
#> with IBB_QUERY_LIMIT. Example use Sys.setenv(IBB_QUERY_LIMIT=10)

# This returns a list of data source names
(df <- get_all_data_sources())
#> # A tibble: 146 x 1
#>    value                                                                                
#>    <chr>                                                                                
#>  1 2017-2019-ibb-sehir-tiyatrolari-oynanan-oyun-sayilari                                
#>  2 2019-yili-ilce-bazinda-susuzluk-sikayet-ve-cevap-sayilari                            
#>  3 2019-yili-park-bahce-ve-yesil-alan-verileri                                          
#>  4 2020-yili-lokasyon-bazinda-cevresel-izleme-ve-kontrol-verileri                       
#>  5 akom-buzlanma-erken-uyari-sistemi-verileri-beus                                      
#>  6 asilanan-hayvanlar                                                                   
#>  7 atik-yonetimi-2017-cevre-hizmetleri                                                  
#>  8 aylara-gore-aktarma-istasyonlarinda-toplanan-karisik-belediye-atik-miktari-web-servi…
#>  9 belnet-sube-ve-uye-sayisi                                                            
#> 10 bina-bilgileri-igdas                                                                 
#> # … with 136 more rows

# This returns detailed information about all data sources.
# You can use resource_id and package_id from this data in other calls.
(df <- get_all_detailed_info(verbose = FALSE))
#> # A tibble: 262 x 23
#>    resource_id package_id mimetype cache_url mimetype_inner hash  description created
#>    <chr>       <chr>      <chr>    <lgl>     <lgl>          <chr> <chr>       <chr>  
#>  1 <NA>        594ca91d-… applica… NA        NA             ""    "İstanbul'… 2020-0…
#>  2 d8db50c3-7… f19f4b31-… applica… NA        NA             ""    "İstanbul'… 2020-0…
#>  3 088a5748-8… 23710169-… applica… NA        NA             ""    "İstanbul'… 2020-0…
#>  4 753a4941-d… 3e76cd75-… applica… NA        NA             ""    "İstanbul'… 2020-0…
#>  5 c6c1b091-7… e9578e58-… applica… NA        NA             ""    "İGDAŞ tar… 2020-0…
#>  6 <NA>        7dd8f1b0-… text/ht… NA        NA             ""    "İBB Veter… 2020-0…
#>  7 <NA>        7dd8f1b0-… applica… NA        NA             ""    "İlgili UR… 2020-0…
#>  8 02bfe245-5… fbc1ed26-… applica… NA        NA             ""    "Ulaşım Yö… 2020-0…
#>  9 <NA>        c796bee2-… <NA>     NA        NA             ""    "Ücretsiz … 2020-0…
#> 10 <NA>        260f49a1-… <NA>     NA        NA             ""    "Bu metot … 2020-0…
#> # … with 252 more rows, and 15 more variables: url <chr>, format <chr>,
#> #   cache_last_updated <lgl>, state <chr>, last_modified <chr>, revision_id <chr>,
#> #   url_type <chr>, position <int>,
#> #   datastore_contains_all_records_of_source_file <chr>, size <int>,
#> #   datastore_active <lgl>, id <chr>, resource_type <lgl>, name <chr>,
#> #   package_name <chr>
```

### Information About a Specific Data Source

``` r
(df <- get_detailed_info_on_data_source(package_id = "594ca91d-0c71-41da-b50a-c7cd30fab67a",
                                       get_all_info = FALSE))
#> # A tibble: 1 x 21
#>   mimetype cache_url mimetype_inner hash  description created url   format
#>   <chr>    <lgl>     <lgl>          <chr> <chr>       <chr>   <chr> <chr> 
#> 1 applica… NA        NA             ""    İstanbul'd… 2020-0… http… XLSX  
#> # … with 13 more variables: cache_last_updated <lgl>, state <chr>, package_id <chr>,
#> #   last_modified <chr>, revision_id <chr>, url_type <chr>, position <int>,
#> #   datastore_contains_all_records_of_source_file <chr>, size <int>,
#> #   datastore_active <lgl>, id <chr>, resource_type <lgl>, name <chr>
```

### Get Data

``` r
(df <- get_data_frame_ibb(resource_id = "99d1edb6-a889-4e69-be7b-21a3f90101f1"))
#> # A tibble: 46 x 5
#>       id Konum         Lokasyon_Sayisi Yerli_Abone_Sayisi Yabanci_Abone_Sayisi
#>    <int> <chr>         <chr>           <chr>              <chr>               
#>  1     1 IETT Otobus   2594            613943             126248              
#>  2     2 FATİH         77              111711             125044              
#>  3     3 BEYOĞLU       35              85845              60064               
#>  4     4 Diger         1479            425477             19108               
#>  5     5 BEŞİKTAŞ      18              28119              8253                
#>  6     6 IETT Metrobus 548             322380             7375                
#>  7     7 KADIKÖY       24              49708              7241                
#>  8     8 ÜSKÜDAR       28              37591              5883                
#>  9     9 BAKIRKÖY      28              35130              5783                
#> 10    10 EYÜPSULTAN    34              29755              4918                
#> # … with 36 more rows
```

### Pre-defined Functions for Data

There are some pre-defined functions for data download. For a full list
please see the package help files.

``` r
(df <- get_ibb_wifi_daily_data_usage())
#> # A tibble: 100 x 11
#>       id Gun   Lokasyon_Sayisi Abone_Sayisi Oturum_Sayisi Cihaz_Sayisi Data_Download_GB
#>    <int> <chr> <chr>           <chr>        <chr>         <chr>        <chr>           
#>  1     1 2019… 2895            58983        95609         59235        6807.38         
#>  2     2 2019… 2328            50629        81088         51115        5944.96         
#>  3     3 2019… 1919            44837        72068         45462        5482.67         
#>  4     4 2019… 2903            61729        100191        62006        6722.92         
#>  5     5 2019… 2905            62073        101260        62399        6712.55         
#>  6     6 2019… 2902            57395        91329         57557        6666.37         
#>  7     7 2019… 3137            64287        105519        64594        7133.57         
#>  8     8 2019… 3133            64160        104175        64407        7042.73         
#>  9     9 2019… 2485            54146        87945         54766        6475.27         
#> 10    10 2019… 2009            47366        76901         47974        5909.62         
#> # … with 90 more rows, and 4 more variables: Data_Upload_GB <chr>, Data_Yerli_GB <chr>,
#> #   Data_Yabanci_GB <chr>, Sure_Saat <chr>
```

## Code of Conduct

Please note that the ibb project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
