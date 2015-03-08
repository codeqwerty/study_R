
R version 3.1.2 (2014-10-31) -- "Pumpkin Helmet"
Copyright (C) 2014 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> install.packages("ggmap")
Installing package into ‘C:/Users/yuriyuri/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
also installing the dependencies ‘maps’, ‘RgoogleMaps’, ‘png’, ‘rjson’, ‘mapproj’

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/maps_2.3-9.zip'
Content type 'application/zip' length 2071089 bytes (2.0 Mb)
opened URL
downloaded 2.0 Mb

Warning in install.packages :
  downloaded length 2071089 != reported length 2071089
trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/RgoogleMaps_1.2.0.7.zip'
Content type 'application/zip' length 714142 bytes (697 Kb)
opened URL
downloaded 697 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/png_0.1-7.zip'
Content type 'application/zip' length 291688 bytes (284 Kb)
opened URL
downloaded 284 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/rjson_0.2.15.zip'
Content type 'application/zip' length 493521 bytes (481 Kb)
opened URL
downloaded 481 Kb

Warning in install.packages :
  downloaded length 493521 != reported length 493521
trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/mapproj_1.2-2.zip'
Content type 'application/zip' length 81050 bytes (79 Kb)
opened URL
downloaded 79 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/ggmap_2.3.zip'
Content type 'application/zip' length 4529845 bytes (4.3 Mb)
opened URL
downloaded 4.3 Mb

Warning in install.packages :
  downloaded length 4529845 != reported length 4529845
package ‘maps’ successfully unpacked and MD5 sums checked
package ‘RgoogleMaps’ successfully unpacked and MD5 sums checked
package ‘png’ successfully unpacked and MD5 sums checked
package ‘rjson’ successfully unpacked and MD5 sums checked
package ‘mapproj’ successfully unpacked and MD5 sums checked
package ‘ggmap’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\yuriyuri\AppData\Local\Temp\RtmpsRGOJl\downloaded_packages
> install.packages("ggplot2")
Installing package into ‘C:/Users/yuriyuri/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/ggplot2_1.0.0.zip'
Content type 'application/zip' length 2674489 bytes (2.6 Mb)
opened URL
downloaded 2.6 Mb

Warning in install.packages :
  downloaded length 2674489 != reported length 2674489
package ‘ggplot2’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\yuriyuri\AppData\Local\Temp\RtmpsRGOJl\downloaded_packages
> library(ggmap)
필요한 패키지를 로딩중입니다: ggplot2
> library(ggplot2)
> setwd("C:/R_workspace/ex_location")
> location_data <- read.csv("location.csv")
> location_data
   name      lat      lng weight
1   1번 37.41151 126.8414      5
2   2번 37.69012 126.9056     10
3   3번 37.46772 127.1478     15
4   4번 37.33515 127.1782     20
5   5번 37.60588 126.9018     25
6   6번 37.86238 126.8325     30
7   7번 37.69648 126.9956     35
8   8번 37.69542 126.8689     40
9   9번 37.58002 126.8678     45
10 10번 37.79628 126.7764     50
11 11번 37.83670 126.8620     55
12 12번 37.78863 126.8400     60
13 13번 37.77953 126.8845     65
14 14번 37.76401 126.8020     70
15 15번 37.45694 126.9883     75
16 16번 37.42155 126.9817     80
17 17번 37.47325 126.6865     85
18 18번 37.52316 126.7247     90
19 19번 37.30726 127.2123     95
20 20번 37.22518 126.9120    100
21 21번 37.27761 127.1725    105
22 22번 37.47143 126.7624    110
23 23번 37.43268 126.8870    115
24 24번 37.66152 126.8529    120
> map <- get_map(location=c(lon=126.8414, lat=37.41151), color="color", source="google", maptype="satellite", zoom=10)
Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=37.41151,126.8414&zoom=10&size=%20640x640&scale=%202&maptype=satellite&sensor=false
Google Maps API Terms of Service : http://developers.google.com/maps/terms
> marker <- geom_point(aes(x=lng, y=lat, color=name, size=weight), data=location_data)
> label <- geom_text(data=location_data, aes(x=lng, y=lat, label=name), size=6, hjust=0.5, vjust=-2.0, color="white")
> ggmap(map) + marker + label
Warning messages:
1: Removed 6 rows containing missing values (geom_point). 
2: Removed 6 rows containing missing values (geom_text). 
> map <- get_map(location=c(lon=126.8414, lat=37.41151), color="color", source="google", maptype="roadmap", zoom=10)
Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=37.41151,126.8414&zoom=10&size=%20640x640&scale=%202&maptype=roadmap&sensor=false
Google Maps API Terms of Service : http://developers.google.com/maps/terms
> ggmap(map) + marker + label
Warning messages:
1: Removed 6 rows containing missing values (geom_point). 
2: Removed 6 rows containing missing values (geom_text). 
> map <- get_map(location=c(lon=126.8414, lat=37.41151), color="color", source="google", maptype="terrain", zoom=10)
Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=37.41151,126.8414&zoom=10&size=%20640x640&scale=%202&maptype=terrain&sensor=false
Google Maps API Terms of Service : http://developers.google.com/maps/terms
> ggmap(map) + marker + label
Warning messages:
1: Removed 6 rows containing missing values (geom_point). 
2: Removed 6 rows containing missing values (geom_text). 
> map <- get_map(location=c(lon=126.8414, lat=37.41151), color="color", source="google", maptype="hybrid", zoom=10)
Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=37.41151,126.8414&zoom=10&size=%20640x640&scale=%202&maptype=hybrid&sensor=false
Google Maps API Terms of Service : http://developers.google.com/maps/terms
> ggmap(map) + marker + label
Warning messages:
1: Removed 6 rows containing missing values (geom_point). 
2: Removed 6 rows containing missing values (geom_text). 
> map <- get_map(location=c(lon=126.8414, lat=37.41151), color="color", source="google", maptype="toner", zoom=10)
maptype = "toner" is only available with source = "stamen".
resetting to source = "stamen"...
Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=37.41151,126.8414&zoom=10&size=%20640x640&maptype=terrain&sensor=false
Google Maps API Terms of Service : http://developers.google.com/maps/terms
Warning messages:
1: In download.file(urls[[k]], destfile = destfile, quiet = !messaging,  :
  downloaded length 17466 != reported length 17466
2: In download.file(urls[[k]], destfile = destfile, quiet = !messaging,  :
  downloaded length 13795 != reported length 13795
> ggmap(map) + marker + label
Warning messages:
1: Removed 6 rows containing missing values (geom_point). 
2: Removed 6 rows containing missing values (geom_text). 
>