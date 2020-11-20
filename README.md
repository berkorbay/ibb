
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ibb

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/ibb)](https://CRAN.R-project.org/package=ibb)
[![R build
status](https://github.com/berkorbay/ibb/workflows/R-CMD-check/badge.svg)](https://github.com/berkorbay/ibb/actions)
<!-- badges: end -->

The goal of ibb is to access [Istanbul Metropolitan Municipality’s Open
Data Portal](https://data.ibb.gov.tr/en/).

## Installation

You can install the released version of ibb from
[CRAN](https://CRAN.R-project.org) with:

    install.packages("ibb")

And the development version from [GitHub](https://github.com/) with:

    # install.packages("devtools")
    devtools::install_github("berkorbay/ibb")

## Usage and Examples

### All Data Sources

    library(ibb)
    #> Welcome to ibb package! This is an unofficial R package for Istanbul Metropolitan Municipality Open Data Portal. For more information, you can visit https://data.ibb.gov.tr/en/
    #> You can set a global limit on number of returned queries with IBB_QUERY_LIMIT. Example use Sys.setenv(IBB_QUERY_LIMIT=10)

    # This returns a list of data source names

    (df <- get_all_data_sources())
    #>   [1] "2017-2019-ibb-sehir-tiyatrolari-oynanan-oyun-sayilari"                                  
    #>   [2] "2019-yili-ilce-bazinda-susuzluk-sikayet-ve-cevap-sayilari"                              
    #>   [3] "2019-yili-park-bahce-ve-yesil-alan-verileri"                                            
    #>   [4] "2020-yili-lokasyon-bazinda-cevresel-izleme-ve-kontrol-verileri"                         
    #>   [5] "akom-buzlanma-erken-uyari-sistemi-verileri-beus"                                        
    #>   [6] "asilanan-hayvanlar"                                                                     
    #>   [7] "atik-yonetimi-2017-cevre-hizmetleri"                                                    
    #>   [8] "aylara-gore-aktarma-istasyonlarinda-toplanan-karisik-belediye-atik-miktari-web-servisi" 
    #>   [9] "belnet-sube-ve-uye-sayisi"                                                              
    #>  [10] "bina-bilgileri-igdas"                                                                   
    #>  [11] "degisken-mesaj-panolarinda-gosterilen-guzergahlar"                                      
    #>  [12] "degisken-mesaj-panolarinda-gosterilen-yogunluk-verisi"                                  
    #>  [13] "deniz-isletmeleri-bazinda-arac-hat-ve-iskele-sayisi"                                    
    #>  [14] "deniz-isletmeleri-bazinda-maksimum-yolculuk-sayisi"                                     
    #>  [15] "deniz-yuzeyi-kiyi-ve-plajlardan-toplanan-kati-atik-miktari"                             
    #>  [16] "deprem-farkindalik-ve-guvenli-yasam-egitimi-alan-kisi-sayisi"                           
    #>  [17] "engelli-merkez-sayilari-ve-basvuru-kriterleri"                                          
    #>  [18] "gaz-birim-fiyati-ve-miktari"                                                            
    #>  [19] "gemi-kaynakli-petrol-turevli-atiklarin-susuzlastirilmasiyla-geri-kazanilan-miktar"      
    #>  [20] "gemilerden-toplanan-atik-miktari-ve-turu"                                               
    #>  [21] "genc-universiteli-egitim-yardimi"                                                       
    #>  [22] "gunluk-arac-sayimi"                                                                     
    #>  [23] "halic-dereagzi-ve-koy-taramasi-yapilan-yerlerden-cikartilan-teressubat-miktari"         
    #>  [24] "hava-kalitesi-istasyon-bilgileri-web-servisi"                                           
    #>  [25] "hava-kalitesi-istasyon-olcum-sonuclari-web-servisi"                                     
    #>  [26] "hayvan-barinaklari-butcesi"                                                             
    #>  [27] "https-www-istanbulsporenvanteri-com"                                                    
    #>  [28] "ibb-butce-raporlari"                                                                    
    #>  [29] "ibb-dava-bilgileri"                                                                     
    #>  [30] "ibb-enerji-tuketim-raporu"                                                              
    #>  [31] "ibb-istac-araclarinin-anlik-konum-ve-hiz-bilgileri"                                     
    #>  [32] "ibb-lokasyon-verileri"                                                                  
    #>  [33] "ibb-sehir-tiyatrolarinda-sergilen-oyunlar"                                              
    #>  [34] "ibbwifi-gunluk-veri-kullanimi"                                                          
    #>  [35] "ibbwifi-gunluk-yeni-yerli-ve-yabanci-abone-sayilari"                                    
    #>  [36] "ibbwifi-ilce-veya-mobil-lokasyona-gore-yeni-abonelik-istatistikleri"                    
    #>  [37] "ibbwifi-lokasyon-grubuna-gore-veri-kullanimi"                                           
    #>  [38] "ibbwifi-lokasyon-kategorisine-gore-veri-kullanimi"                                      
    #>  [39] "ibbwifi-lokasyon-kategorisine-gore-yeni-yerli-ve-yabanci-abone-sayilari"                
    #>  [40] "ibbwifi-ulkelere-gore-abone-dagilimi"                                                   
    #>  [41] "ibb-ye-ait-hayvan-barinaklari"                                                          
    #>  [42] "iett-arac-ozellikleri-web-servisi"                                                      
    #>  [43] "iett-duyurular-web-servisi"                                                             
    #>  [44] "iett-hat-durak-guzergah-web-servisi"                                                    
    #>  [45] "iett-ibb360-web-servisi"                                                                
    #>  [46] "iett-ibb-web-servisi"                                                                   
    #>  [47] "iett-planlanan-sefer-saati-web-servisi"                                                 
    #>  [48] "igdas-calisan-bilgileri"                                                                
    #>  [49] "ikitelli-gunes-enerjisi-santrali-elektrik-uretim-miktarlari"                            
    #>  [50] "ilce-bazinda-yillara-gore-dogalgaz-tuketim-miktari"                                     
    #>  [51] "ilcelere-gore-abone-sayilari"                                                           
    #>  [52] "ilce-ve-sektor-bazinda-birinci-sinif-gayrisihhi-muessese-sayisi"                        
    #>  [53] "ilce-yil-ve-atik-turu-bazinda-atik-miktari"                                             
    #>  [54] "isbike-istasyon-durumlari-web-servisi"                                                  
    #>  [55] "iski-2019-yili-duyurulari"                                                              
    #>  [56] "iski-ilce-bazli-cagri-sayisi-ve-cozum-orani"                                            
    #>  [57] "iski-ilce-ve-mahalle-bazli-gelen-ve-cevaplanan-kanal-ariza-sayisi"                      
    #>  [58] "iski-ilce-ve-mahalle-bazli-gelen-ve-cevaplanan-su-ariza-sayisi"                         
    #>  [59] "iski-personel-sayisi"                                                                   
    #>  [60] "ispark-otopark-detay-bilgileri-web-servisi"                                             
    #>  [61] "ispark-otoparklarina-ait-bilgiler"                                                      
    #>  [62] "ispark-otopark-listesi-web-servisi"                                                     
    #>  [63] "is-sagligi-ve-guvenligi-egitimi-alan-ibb-personeli-sayisi"                              
    #>  [64] "istanbul-ana-arter-yol-agi-koordinatlari"                                               
    #>  [65] "istanbul-a-verilen-temiz-su-miktarlari"                                                 
    #>  [66] "istanbul-avrupa-anadolu-park-lokasyonlari"                                              
    #>  [67] "istanbul-baraj-doluluk-oranlari"                                                        
    #>  [68] "istanbul-da-son-bir-yilda-gerceklesen-depremler"                                        
    #>  [69] "istanbul-genel-yesil-alan-bilgiler-2004-2019"                                           
    #>  [70] "istanbul-gunes-enerji-santralleri-uretim-miktarlari"                                    
    #>  [71] "istanbulkart-dolum-merkezi-bilgileri"                                                   
    #>  [72] "istanbul-lojistik-dis-kesit-transit-gecisler-raporu"                                    
    #>  [73] "istanbul-lojistik-firma-gorusmeleri-saha-arastirmasi-sentez-raporu"                     
    #>  [74] "istanbul-lojistik-perde-noktalari-trafik-sayim-istatistikleri-sentez-raporu"            
    #>  [75] "istanbul-odak-noktalari-saha-arastirmasi-sentez-raporu"                                 
    #>  [76] "istanbul-saglik-kurum-ve-kuruluslari-verisi"                                            
    #>  [77] "istanbul-ulasim-ana-plani-hanehalki-arastirmasi"                                        
    #>  [78] "itfai-istatistikler"                                                                    
    #>  [79] "itfai-istatistikler-yangin"                                                             
    #>  [80] "itfaiye-istasyonlari-konum-bilgileri"                                                   
    #>  [81] "izcilik-faaliyetinden-faydalanan-kisi-sayisi"                                           
    #>  [82] "karayollari-bazinda-arac-ve-hat-sayisi"                                                 
    #>  [83] "karayollari-bazinda-maksimum-yolculuk-sayisi"                                           
    #>  [84] "kentsel-donusum-projesi"                                                                
    #>  [85] "kisirlastirilan-hayvanlar"                                                              
    #>  [86] "kisla-mucadele-faaliyetleri-kapsaminda-buzlanmayi-onlemek-amaciyla-kullanilan-yontemler"
    #>  [87] "mevcut-bisiklet-yollari"                                                                
    #>  [88] "mezarlik-adres-bilgileri"                                                               
    #>  [89] "mikrociple-kayit-altina-alinan-hayvanlar"                                               
    #>  [90] "muayene-edilen-hayvanlar"                                                               
    #>  [91] "muhtarlik-adres-bilgileri"                                                              
    #>  [92] "musahadeye-alinan-hayvanlar"                                                            
    #>  [93] "nufus-bilgileri"                                                                        
    #>  [94] "operasyon-uygulanan-hayvanlar"                                                          
    #>  [95] "otomatik-meteorolojik-gozlem-istasyonu-verileri"                                        
    #>  [96] "ozel-konulu-is-sagligi-ve-guvenligi-egitimi-ibb-personeli-sayisi"                       
    #>  [97] "paylasimli-bisiklet-yollari"                                                            
    #>  [98] "rayli-sistem-gunluk-maksimum-yolculuk-sayilari"                                         
    #>  [99] "rayli-sistem-insaat-ilerleme-oranlari"                                                  
    #> [100] "rayli-sistemler-cekmekoy-sultanbeyli-metro-hatti-bilgileri"                             
    #> [101] "rayli-sistemler-dudullu-bostanci-metro-hatti-bilgileri"                                 
    #> [102] "rayli-sistemlere-ait-aktarma-bilgileri"                                                 
    #> [103] "rayli-sistemlere-ait-hat-uzunluk-bilgileri"                                             
    #> [104] "rayli-sistemlere-ait-internet-siteleri"                                                 
    #> [105] "rayli-sistemlere-ait-istasyon-bilgileri"                                                
    #> [106] "rayli-sistemlere-ait-tamamlanmis-santiye-bilgileri"                                     
    #> [107] "rayli-sistemler-eminonu-alibeykoy-tramvay-hatti-bilgileri"                              
    #> [108] "rayli-sistemler-gunluk-aylik-yillik-hat-bazli-sefer-sayilari"                           
    #> [109] "rayli-sistemler-gunluk-aylik-yillik-vagon-kilometre-bilgileri"                          
    #> [110] "rayli-sistemler-hastane-yenidogan-metro-hatti-bilgileri"                                
    #> [111] "rayli-sistemler-hat-bazli-sefer-sayilari"                                               
    #> [112] "rayli-sistemler-hat-bazli-yolculuk-sayilari"                                            
    #> [113] "rayli-sistemler-ikitelli-atakoy-metro-hatti-verisi"                                     
    #> [114] "rayli-sistemler-kabatas-mecidiykoy-mahmutbey-metro-hatti-bilgileri"                     
    #> [115] "rayli-sistemler-kaynarca-tuzla-metro-hatti-bilgileri"                                   
    #> [116] "rayli-sistemler-kirazli-halkali-istasyonu-asansor-ve-yuruyen-merdiven-sayisi"           
    #> [117] "rayli-sistemler-kirazli-halkali-istasyonu-diger-hatlarla-baglanti-noktalari"            
    #> [118] "rayli-sistemler-kirazli-halkali-metro-hatti-ilce-istasyon-bilgileri"                    
    #> [119] "rayli-sistemler-m7-kabatas-mecidiyekoy-mahmutbey-metro-hatti-otopark-bilgileri"         
    #> [120] "rayli-sistemler-maksimum-yolculuk-sayisi"                                               
    #> [121] "rayli-sistemler-pendik-kaynarca-hastane-metro-hatti-bilgileri"                          
    #> [122] "rayli-sistemler-rumelihisarustu-asiyan-funikuler-hatti-ilce-istasyon-verisi"            
    #> [123] "rayli-sistemler-umraniye-atasehir-goztepe-metro-hatti-bilgileri"                        
    #> [124] "rayli-sistemler-vagon-kilometre-bilgileri"                                              
    #> [125] "rehabilite-edilip-alindigi-ortama-birakilan-hayvanlar"                                  
    #> [126] "saatlik-trafik-yogunluk-veri-seti"                                                      
    #> [127] "sahiplendirilen-hayvanlar"                                                              
    #> [128] "sefer-gerceklesme-web-servisi"                                                          
    #> [129] "sokak-hayvanlarina-ayrilan-butce"                                                       
    #> [130] "sokak-hayvanlarina-verilen-mama-miktari"                                                
    #> [131] "spor-organizasyonlari-ve-sporcu-sayilari"                                               
    #> [132] "tedavi-edilen-hayvanlar"                                                                
    #> [133] "toplu-tasima-bilet-fiyatlari"                                                           
    #> [134] "toplu-ulasim-arac-dezenfeksiyon-sorgulama-sistemi"                                      
    #> [135] "trafik-indeks-degeri-web-servisi"                                                       
    #> [136] "trafik-indeks-raporu"                                                                   
    #> [137] "trafik-yogunluk-haritasi"                                                               
    #> [138] "tum-isbike-istasyonlari-web-servisi"                                                    
    #> [139] "ucretsiz-ibbwifi-hizmeti-sunulan-lokasyonlar"                                           
    #> [140] "ulasim-yonetim-merkezi-uym-tarafindan-sisteme-girilen-trafik-duyurulari"                
    #> [141] "veteriner-rehabilitasyon-istatistikleri"                                                
    #> [142] "yatirim-turu-ve-uzunluk-bilgileri"                                                      
    #> [143] "yil-bazli-atik-alinan-gemi-sayisi"                                                      
    #> [144] "yillara-gore-atiktan-geri-kazanim-miktarlari"                                           
    #> [145] "yillara-gore-kentsel-atik-geri-kazanim-orani"                                           
    #> [146] "yolculuk-turu-bazinda-yolcu-sayisi"

    # This returns detailed information about all data sources.
    # You can use resource_id and package_id from this data in other calls.

    (df <- get_all_detailed_info(verbose = FALSE))
    #> [1] "Getting info on: 2017-2019-ibb-sehir-tiyatrolari-oynanan-oyun-sayilari Package 1/146"
    #> [1] "Getting info on: 2019-yili-ilce-bazinda-susuzluk-sikayet-ve-cevap-sayilari Package 2/146"
    #> [1] "Getting info on: 2019-yili-park-bahce-ve-yesil-alan-verileri Package 3/146"
    #> [1] "Getting info on: 2020-yili-lokasyon-bazinda-cevresel-izleme-ve-kontrol-verileri Package 4/146"
    #> [1] "Getting info on: akom-buzlanma-erken-uyari-sistemi-verileri-beus Package 5/146"
    #> [1] "Getting info on: asilanan-hayvanlar Package 6/146"
    #> [1] "Getting info on: atik-yonetimi-2017-cevre-hizmetleri Package 7/146"
    #> [1] "Getting info on: aylara-gore-aktarma-istasyonlarinda-toplanan-karisik-belediye-atik-miktari-web-servisi Package 8/146"
    #> [1] "Getting info on: belnet-sube-ve-uye-sayisi Package 9/146"
    #> [1] "Getting info on: bina-bilgileri-igdas Package 10/146"
    #> [1] "Getting info on: degisken-mesaj-panolarinda-gosterilen-guzergahlar Package 11/146"
    #> [1] "Getting info on: degisken-mesaj-panolarinda-gosterilen-yogunluk-verisi Package 12/146"
    #> [1] "Getting info on: deniz-isletmeleri-bazinda-arac-hat-ve-iskele-sayisi Package 13/146"
    #> [1] "Getting info on: deniz-isletmeleri-bazinda-maksimum-yolculuk-sayisi Package 14/146"
    #> [1] "Getting info on: deniz-yuzeyi-kiyi-ve-plajlardan-toplanan-kati-atik-miktari Package 15/146"
    #> [1] "Getting info on: deprem-farkindalik-ve-guvenli-yasam-egitimi-alan-kisi-sayisi Package 16/146"
    #> [1] "Getting info on: engelli-merkez-sayilari-ve-basvuru-kriterleri Package 17/146"
    #> [1] "Getting info on: gaz-birim-fiyati-ve-miktari Package 18/146"
    #> [1] "Getting info on: gemi-kaynakli-petrol-turevli-atiklarin-susuzlastirilmasiyla-geri-kazanilan-miktar Package 19/146"
    #> [1] "Getting info on: gemilerden-toplanan-atik-miktari-ve-turu Package 20/146"
    #> [1] "Getting info on: genc-universiteli-egitim-yardimi Package 21/146"
    #> [1] "Getting info on: gunluk-arac-sayimi Package 22/146"
    #> [1] "Getting info on: halic-dereagzi-ve-koy-taramasi-yapilan-yerlerden-cikartilan-teressubat-miktari Package 23/146"
    #> [1] "Getting info on: hava-kalitesi-istasyon-bilgileri-web-servisi Package 24/146"
    #> [1] "Getting info on: hava-kalitesi-istasyon-olcum-sonuclari-web-servisi Package 25/146"
    #> [1] "Getting info on: hayvan-barinaklari-butcesi Package 26/146"
    #> [1] "Getting info on: https-www-istanbulsporenvanteri-com Package 27/146"
    #> [1] "Getting info on: ibb-butce-raporlari Package 28/146"
    #> [1] "Getting info on: ibb-dava-bilgileri Package 29/146"
    #> [1] "Getting info on: ibb-enerji-tuketim-raporu Package 30/146"
    #> [1] "Getting info on: ibb-istac-araclarinin-anlik-konum-ve-hiz-bilgileri Package 31/146"
    #> [1] "Getting info on: ibb-lokasyon-verileri Package 32/146"
    #> [1] "Getting info on: ibb-sehir-tiyatrolarinda-sergilen-oyunlar Package 33/146"
    #> [1] "Getting info on: ibbwifi-gunluk-veri-kullanimi Package 34/146"
    #> [1] "Getting info on: ibbwifi-gunluk-yeni-yerli-ve-yabanci-abone-sayilari Package 35/146"
    #> [1] "Getting info on: ibbwifi-ilce-veya-mobil-lokasyona-gore-yeni-abonelik-istatistikleri Package 36/146"
    #> [1] "Getting info on: ibbwifi-lokasyon-grubuna-gore-veri-kullanimi Package 37/146"
    #> [1] "Getting info on: ibbwifi-lokasyon-kategorisine-gore-veri-kullanimi Package 38/146"
    #> [1] "Getting info on: ibbwifi-lokasyon-kategorisine-gore-yeni-yerli-ve-yabanci-abone-sayilari Package 39/146"
    #> [1] "Getting info on: ibbwifi-ulkelere-gore-abone-dagilimi Package 40/146"
    #> [1] "Getting info on: ibb-ye-ait-hayvan-barinaklari Package 41/146"
    #> [1] "Getting info on: iett-arac-ozellikleri-web-servisi Package 42/146"
    #> [1] "Getting info on: iett-duyurular-web-servisi Package 43/146"
    #> [1] "Getting info on: iett-hat-durak-guzergah-web-servisi Package 44/146"
    #> [1] "Getting info on: iett-ibb360-web-servisi Package 45/146"
    #> [1] "Getting info on: iett-ibb-web-servisi Package 46/146"
    #> [1] "Getting info on: iett-planlanan-sefer-saati-web-servisi Package 47/146"
    #> [1] "Getting info on: igdas-calisan-bilgileri Package 48/146"
    #> [1] "Getting info on: ikitelli-gunes-enerjisi-santrali-elektrik-uretim-miktarlari Package 49/146"
    #> [1] "Getting info on: ilce-bazinda-yillara-gore-dogalgaz-tuketim-miktari Package 50/146"
    #> [1] "Getting info on: ilcelere-gore-abone-sayilari Package 51/146"
    #> [1] "Getting info on: ilce-ve-sektor-bazinda-birinci-sinif-gayrisihhi-muessese-sayisi Package 52/146"
    #> [1] "Getting info on: ilce-yil-ve-atik-turu-bazinda-atik-miktari Package 53/146"
    #> [1] "Getting info on: isbike-istasyon-durumlari-web-servisi Package 54/146"
    #> [1] "Getting info on: iski-2019-yili-duyurulari Package 55/146"
    #> [1] "Getting info on: iski-ilce-bazli-cagri-sayisi-ve-cozum-orani Package 56/146"
    #> [1] "Getting info on: iski-ilce-ve-mahalle-bazli-gelen-ve-cevaplanan-kanal-ariza-sayisi Package 57/146"
    #> [1] "Getting info on: iski-ilce-ve-mahalle-bazli-gelen-ve-cevaplanan-su-ariza-sayisi Package 58/146"
    #> [1] "Getting info on: iski-personel-sayisi Package 59/146"
    #> [1] "Getting info on: ispark-otopark-detay-bilgileri-web-servisi Package 60/146"
    #> [1] "Getting info on: ispark-otoparklarina-ait-bilgiler Package 61/146"
    #> [1] "Getting info on: ispark-otopark-listesi-web-servisi Package 62/146"
    #> [1] "Getting info on: is-sagligi-ve-guvenligi-egitimi-alan-ibb-personeli-sayisi Package 63/146"
    #> [1] "Getting info on: istanbul-ana-arter-yol-agi-koordinatlari Package 64/146"
    #> [1] "Getting info on: istanbul-a-verilen-temiz-su-miktarlari Package 65/146"
    #> [1] "Getting info on: istanbul-avrupa-anadolu-park-lokasyonlari Package 66/146"
    #> [1] "Getting info on: istanbul-baraj-doluluk-oranlari Package 67/146"
    #> [1] "Getting info on: istanbul-da-son-bir-yilda-gerceklesen-depremler Package 68/146"
    #> [1] "Getting info on: istanbul-genel-yesil-alan-bilgiler-2004-2019 Package 69/146"
    #> [1] "Getting info on: istanbul-gunes-enerji-santralleri-uretim-miktarlari Package 70/146"
    #> [1] "Getting info on: istanbulkart-dolum-merkezi-bilgileri Package 71/146"
    #> [1] "Getting info on: istanbul-lojistik-dis-kesit-transit-gecisler-raporu Package 72/146"
    #> [1] "Getting info on: istanbul-lojistik-firma-gorusmeleri-saha-arastirmasi-sentez-raporu Package 73/146"
    #> [1] "Getting info on: istanbul-lojistik-perde-noktalari-trafik-sayim-istatistikleri-sentez-raporu Package 74/146"
    #> [1] "Getting info on: istanbul-odak-noktalari-saha-arastirmasi-sentez-raporu Package 75/146"
    #> [1] "Getting info on: istanbul-saglik-kurum-ve-kuruluslari-verisi Package 76/146"
    #> [1] "Getting info on: istanbul-ulasim-ana-plani-hanehalki-arastirmasi Package 77/146"
    #> [1] "Getting info on: itfai-istatistikler Package 78/146"
    #> [1] "Getting info on: itfai-istatistikler-yangin Package 79/146"
    #> [1] "Getting info on: itfaiye-istasyonlari-konum-bilgileri Package 80/146"
    #> [1] "Getting info on: izcilik-faaliyetinden-faydalanan-kisi-sayisi Package 81/146"
    #> [1] "Getting info on: karayollari-bazinda-arac-ve-hat-sayisi Package 82/146"
    #> [1] "Getting info on: karayollari-bazinda-maksimum-yolculuk-sayisi Package 83/146"
    #> [1] "Getting info on: kentsel-donusum-projesi Package 84/146"
    #> [1] "Getting info on: kisirlastirilan-hayvanlar Package 85/146"
    #> [1] "Getting info on: kisla-mucadele-faaliyetleri-kapsaminda-buzlanmayi-onlemek-amaciyla-kullanilan-yontemler Package 86/146"
    #> [1] "Getting info on: mevcut-bisiklet-yollari Package 87/146"
    #> [1] "Getting info on: mezarlik-adres-bilgileri Package 88/146"
    #> [1] "Getting info on: mikrociple-kayit-altina-alinan-hayvanlar Package 89/146"
    #> [1] "Getting info on: muayene-edilen-hayvanlar Package 90/146"
    #> [1] "Getting info on: muhtarlik-adres-bilgileri Package 91/146"
    #> [1] "Getting info on: musahadeye-alinan-hayvanlar Package 92/146"
    #> [1] "Getting info on: nufus-bilgileri Package 93/146"
    #> [1] "Getting info on: operasyon-uygulanan-hayvanlar Package 94/146"
    #> [1] "Getting info on: otomatik-meteorolojik-gozlem-istasyonu-verileri Package 95/146"
    #> [1] "Getting info on: ozel-konulu-is-sagligi-ve-guvenligi-egitimi-ibb-personeli-sayisi Package 96/146"
    #> [1] "Getting info on: paylasimli-bisiklet-yollari Package 97/146"
    #> [1] "Getting info on: rayli-sistem-gunluk-maksimum-yolculuk-sayilari Package 98/146"
    #> [1] "Getting info on: rayli-sistem-insaat-ilerleme-oranlari Package 99/146"
    #> [1] "Getting info on: rayli-sistemler-cekmekoy-sultanbeyli-metro-hatti-bilgileri Package 100/146"
    #> [1] "Getting info on: rayli-sistemler-dudullu-bostanci-metro-hatti-bilgileri Package 101/146"
    #> [1] "Getting info on: rayli-sistemlere-ait-aktarma-bilgileri Package 102/146"
    #> [1] "Getting info on: rayli-sistemlere-ait-hat-uzunluk-bilgileri Package 103/146"
    #> [1] "Getting info on: rayli-sistemlere-ait-internet-siteleri Package 104/146"
    #> [1] "Getting info on: rayli-sistemlere-ait-istasyon-bilgileri Package 105/146"
    #> [1] "Getting info on: rayli-sistemlere-ait-tamamlanmis-santiye-bilgileri Package 106/146"
    #> [1] "Getting info on: rayli-sistemler-eminonu-alibeykoy-tramvay-hatti-bilgileri Package 107/146"
    #> [1] "Getting info on: rayli-sistemler-gunluk-aylik-yillik-hat-bazli-sefer-sayilari Package 108/146"
    #> [1] "Getting info on: rayli-sistemler-gunluk-aylik-yillik-vagon-kilometre-bilgileri Package 109/146"
    #> [1] "Getting info on: rayli-sistemler-hastane-yenidogan-metro-hatti-bilgileri Package 110/146"
    #> [1] "Getting info on: rayli-sistemler-hat-bazli-sefer-sayilari Package 111/146"
    #> [1] "Getting info on: rayli-sistemler-hat-bazli-yolculuk-sayilari Package 112/146"
    #> [1] "Getting info on: rayli-sistemler-ikitelli-atakoy-metro-hatti-verisi Package 113/146"
    #> [1] "Getting info on: rayli-sistemler-kabatas-mecidiykoy-mahmutbey-metro-hatti-bilgileri Package 114/146"
    #> [1] "Getting info on: rayli-sistemler-kaynarca-tuzla-metro-hatti-bilgileri Package 115/146"
    #> [1] "Getting info on: rayli-sistemler-kirazli-halkali-istasyonu-asansor-ve-yuruyen-merdiven-sayisi Package 116/146"
    #> [1] "Getting info on: rayli-sistemler-kirazli-halkali-istasyonu-diger-hatlarla-baglanti-noktalari Package 117/146"
    #> [1] "Getting info on: rayli-sistemler-kirazli-halkali-metro-hatti-ilce-istasyon-bilgileri Package 118/146"
    #> [1] "Getting info on: rayli-sistemler-m7-kabatas-mecidiyekoy-mahmutbey-metro-hatti-otopark-bilgileri Package 119/146"
    #> [1] "Getting info on: rayli-sistemler-maksimum-yolculuk-sayisi Package 120/146"
    #> [1] "Getting info on: rayli-sistemler-pendik-kaynarca-hastane-metro-hatti-bilgileri Package 121/146"
    #> [1] "Getting info on: rayli-sistemler-rumelihisarustu-asiyan-funikuler-hatti-ilce-istasyon-verisi Package 122/146"
    #> [1] "Getting info on: rayli-sistemler-umraniye-atasehir-goztepe-metro-hatti-bilgileri Package 123/146"
    #> [1] "Getting info on: rayli-sistemler-vagon-kilometre-bilgileri Package 124/146"
    #> [1] "Getting info on: rehabilite-edilip-alindigi-ortama-birakilan-hayvanlar Package 125/146"
    #> [1] "Getting info on: saatlik-trafik-yogunluk-veri-seti Package 126/146"
    #> [1] "Getting info on: sahiplendirilen-hayvanlar Package 127/146"
    #> [1] "Getting info on: sefer-gerceklesme-web-servisi Package 128/146"
    #> [1] "Getting info on: sokak-hayvanlarina-ayrilan-butce Package 129/146"
    #> [1] "Getting info on: sokak-hayvanlarina-verilen-mama-miktari Package 130/146"
    #> [1] "Getting info on: spor-organizasyonlari-ve-sporcu-sayilari Package 131/146"
    #> [1] "Getting info on: tedavi-edilen-hayvanlar Package 132/146"
    #> [1] "Getting info on: toplu-tasima-bilet-fiyatlari Package 133/146"
    #> [1] "Getting info on: toplu-ulasim-arac-dezenfeksiyon-sorgulama-sistemi Package 134/146"
    #> [1] "Getting info on: trafik-indeks-degeri-web-servisi Package 135/146"
    #> [1] "Getting info on: trafik-indeks-raporu Package 136/146"
    #> [1] "Getting info on: trafik-yogunluk-haritasi Package 137/146"
    #> [1] "Getting info on: tum-isbike-istasyonlari-web-servisi Package 138/146"
    #> [1] "Getting info on: ucretsiz-ibbwifi-hizmeti-sunulan-lokasyonlar Package 139/146"
    #> [1] "Getting info on: ulasim-yonetim-merkezi-uym-tarafindan-sisteme-girilen-trafik-duyurulari Package 140/146"
    #> [1] "Getting info on: veteriner-rehabilitasyon-istatistikleri Package 141/146"
    #> [1] "Getting info on: yatirim-turu-ve-uzunluk-bilgileri Package 142/146"
    #> [1] "Getting info on: yil-bazli-atik-alinan-gemi-sayisi Package 143/146"
    #> [1] "Getting info on: yillara-gore-atiktan-geri-kazanim-miktarlari Package 144/146"
    #> [1] "Getting info on: yillara-gore-kentsel-atik-geri-kazanim-orani Package 145/146"
    #> [1] "Getting info on: yolculuk-turu-bazinda-yolcu-sayisi Package 146/146"
    #> # A tibble: 262 x 23
    #>    resource_id package_id datastore_conta… datastore_active id      size
    #>    <chr>       <chr>      <chr>            <lgl>            <chr>  <int>
    #>  1 311f8744-8… c9145e52-… True             TRUE             311f… 9.07e3
    #>  2 <NA>        c9145e52-… False            FALSE            4e83… 3.45e5
    #>  3 4b2fc348-5… f41d89f1-… True             TRUE             4b2f… 4.17e4
    #>  4 1d9762dc-b… 0c3c3369-… True             TRUE             1d97… 1.90e4
    #>  5 <NA>        0dd1d714-… False            TRUE             54bc… 4.30e5
    #>  6 9bfc89aa-8… 824c942e-… True             TRUE             9bfc… 1.13e7
    #>  7 2013bd85-e… 824c942e-… True             TRUE             2013… 1.65e7
    #>  8 e5d17422-2… 824c942e-… True             TRUE             e5d1… 3.87e6
    #>  9 <NA>        9f4de8dc-… False            FALSE            8fbe… 3.44e5
    #> 10 <NA>        9f4de8dc-… False            FALSE            8ecf… 6.99e5
    #> # … with 252 more rows, and 17 more variables: cache_last_updated <lgl>,
    #> #   state <chr>, hash <chr>, description <chr>, format <chr>,
    #> #   mimetype_inner <lgl>, url_type <chr>, mimetype <chr>, cache_url <lgl>,
    #> #   name <chr>, created <chr>, url <chr>, last_modified <chr>, position <int>,
    #> #   revision_id <chr>, resource_type <lgl>, package_name <chr>

### Information About a Specific Data Source

    (df <- get_detailed_info_on_data_source(package_id = "594ca91d-0c71-41da-b50a-c7cd30fab67a",
                                           get_all_info = FALSE))
    #>                                                            mimetype cache_url
    #> 1 application/vnd.openxmlformats-officedocument.spreadsheetml.sheet        NA
    #>   mimetype_inner hash
    #> 1             NA     
    #>                                                        description
    #> 1 İstanbul'da yolculuk türüne göre yıllık yolcu sayılarını içerir.
    #>                      created
    #> 1 2020-01-10T08:26:02.513339
    #>                                                                                                                                                                url
    #> 1 https://data.ibb.gov.tr/dataset/594ca91d-0c71-41da-b50a-c7cd30fab67a/resource/c2c6cec1-ceb5-4fab-8d87-c5d900a99809/download/yolculuk-turu-baznda-yolcu-says.xlsx
    #>   format cache_last_updated  state                           package_id
    #> 1   XLSX                 NA active 594ca91d-0c71-41da-b50a-c7cd30fab67a
    #>                last_modified                          revision_id url_type
    #> 1 2020-02-12T08:21:30.736945 76233adf-752b-420b-8167-fcfe8c7b95b9   upload
    #>   position datastore_contains_all_records_of_source_file  size datastore_active
    #> 1        0                                         False 13328             TRUE
    #>                                     id resource_type
    #> 1 c2c6cec1-ceb5-4fab-8d87-c5d900a99809            NA
    #>                                      name
    #> 1 Yolculuk Türü Bazında Yolcu Sayısı.xlsx

### Get Data

    (df <- get_data_frame_ibb(resource_id = "99d1edb6-a889-4e69-be7b-21a3f90101f1"))
    #> Warning: `tbl_df()` is deprecated as of dplyr 1.0.0.
    #> Please use `tibble::as_tibble()` instead.
    #> This warning is displayed once every 8 hours.
    #> Call `lifecycle::last_warnings()` to see where this warning was generated.
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

### Pre-defined Functions for Data

There are some pre-defined functions for data download. For a full list
please see the package help files.

    (df <- get_ibb_wifi_daily_data_usage())
    #> # A tibble: 100 x 11
    #>       id Gun   Lokasyon_Sayisi Abone_Sayisi Oturum_Sayisi Cihaz_Sayisi
    #>    <int> <chr> <chr>           <chr>        <chr>         <chr>       
    #>  1     1 2019… 2895            58983        95609         59235       
    #>  2     2 2019… 2328            50629        81088         51115       
    #>  3     3 2019… 1919            44837        72068         45462       
    #>  4     4 2019… 2903            61729        100191        62006       
    #>  5     5 2019… 2905            62073        101260        62399       
    #>  6     6 2019… 2902            57395        91329         57557       
    #>  7     7 2019… 3137            64287        105519        64594       
    #>  8     8 2019… 3133            64160        104175        64407       
    #>  9     9 2019… 2485            54146        87945         54766       
    #> 10    10 2019… 2009            47366        76901         47974       
    #> # … with 90 more rows, and 5 more variables: Data_Download_GB <chr>,
    #> #   Data_Upload_GB <chr>, Data_Yerli_GB <chr>, Data_Yabanci_GB <chr>,
    #> #   Sure_Saat <chr>

## Code of Conduct

Please note that the ibb project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
