
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

> install.packages("devtools")
Warning in install.packages :
  downloaded length 227 != reported length 227
Installing package into ‘C:/Users/yuriyuri/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
also installing the dependencies ‘mime’, ‘R6’, ‘bitops’, ‘brew’, ‘httr’, ‘RCurl’, ‘memoise’, ‘whisker’, ‘evaluate’, ‘rstudioapi’, ‘jsonlite’, ‘roxygen2’

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/mime_0.2.zip'
Content type 'application/zip' length 34989 bytes (34 Kb)
opened URL
downloaded 34 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/R6_2.0.1.zip'
Content type 'application/zip' length 123267 bytes (120 Kb)
opened URL
downloaded 120 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/bitops_1.0-6.zip'
Content type 'application/zip' length 36022 bytes (35 Kb)
opened URL
downloaded 35 Kb

Warning in install.packages :
  downloaded length 36022 != reported length 36022
trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/brew_1.0-6.zip'
Content type 'application/zip' length 104722 bytes (102 Kb)
opened URL
downloaded 102 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/httr_0.6.1.zip'
Content type 'application/zip' length 387541 bytes (378 Kb)
opened URL
downloaded 378 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/RCurl_1.95-4.5.zip'
Content type 'application/zip' length 2703917 bytes (2.6 Mb)
opened URL
downloaded 2.6 Mb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/memoise_0.2.1.zip'
Content type 'application/zip' length 16863 bytes (16 Kb)
opened URL
downloaded 16 Kb

Warning in install.packages :
  downloaded length 16863 != reported length 16863
trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/whisker_0.3-2.zip'
Content type 'application/zip' length 64693 bytes (63 Kb)
opened URL
downloaded 63 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/evaluate_0.5.5.zip'
Content type 'application/zip' length 38640 bytes (37 Kb)
opened URL
downloaded 37 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/rstudioapi_0.2.zip'
Content type 'application/zip' length 24692 bytes (24 Kb)
opened URL
downloaded 24 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/jsonlite_0.9.14.zip'
Content type 'application/zip' length 927126 bytes (905 Kb)
opened URL
downloaded 905 Kb

Warning in install.packages :
  downloaded length 927126 != reported length 927126
trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/roxygen2_4.1.0.zip'
Content type 'application/zip' length 587839 bytes (574 Kb)
opened URL
downloaded 574 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/devtools_1.7.0.zip'
Content type 'application/zip' length 308736 bytes (301 Kb)
opened URL
downloaded 301 Kb

package ‘mime’ successfully unpacked and MD5 sums checked
package ‘R6’ successfully unpacked and MD5 sums checked
package ‘bitops’ successfully unpacked and MD5 sums checked
package ‘brew’ successfully unpacked and MD5 sums checked
package ‘httr’ successfully unpacked and MD5 sums checked
package ‘RCurl’ successfully unpacked and MD5 sums checked
package ‘memoise’ successfully unpacked and MD5 sums checked
package ‘whisker’ successfully unpacked and MD5 sums checked
package ‘evaluate’ successfully unpacked and MD5 sums checked
package ‘rstudioapi’ successfully unpacked and MD5 sums checked
package ‘jsonlite’ successfully unpacked and MD5 sums checked
package ‘roxygen2’ successfully unpacked and MD5 sums checked
package ‘devtools’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\yuriyuri\AppData\Local\Temp\RtmpQ7Vq8F\downloaded_packages
> require(devtools)
필요한 패키지를 로딩중입니다: devtools
WARNING: Rtools is required to build R packages, but is not currently installed.

Please download and install Rtools 3.1 from http://cran.r-project.org/bin/windows/Rtools/ and then run find_rtools().
> install_github('ramnathv/rcharts')
Downloading github repo ramnathv/rcharts@master
Installing rCharts
Installing dependencies for rCharts:
RJSONIO, yaml
Installing packages into ‘C:/Users/yuriyuri/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/RJSONIO_1.3-0.zip'
Content type 'application/zip' length 1236066 bytes (1.2 Mb)
opened URL
downloaded 1.2 Mb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/yaml_2.1.13.zip'
Content type 'application/zip' length 180084 bytes (175 Kb)
opened URL
downloaded 175 Kb

package ‘RJSONIO’ successfully unpacked and MD5 sums checked
package ‘yaml’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\yuriyuri\AppData\Local\Temp\RtmpQ7Vq8F\downloaded_packages
"C:/PROGRA~1/R/R-31~1.2/bin/x64/R" --vanilla CMD INSTALL  \
  "C:/Users/yuriyuri/AppData/Local/Temp/RtmpQ7Vq8F/devtools35101c21764/ramnathv-rCharts-389e214"  \
  --library="C:/Users/yuriyuri/Documents/R/win-library/3.1"  \
  --install-tests 

* installing *source* package 'rCharts' ...
** R
** demo
** inst
** preparing package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded
*** arch - i386
*** arch - x64
* DONE (rCharts)
Warning messages:
1: In download.file(url, destfile, method, mode = "wb", ...) :
  downloaded length 1236066 != reported length 1236066
2: In download.file(url, destfile, method, mode = "wb", ...) :
  downloaded length 180084 != reported length 180084
> require(rCharts)
필요한 패키지를 로딩중입니다: rCharts
> setwd("C:/R_workspace/ex_InternatinalMarriage")
> data=read.csv("foreign.csv")
> data
      Country foreign_wife foreign_husband
1       Japan          342             250
2       China         1642             681
3     America          213             579
4  Philippine          285               7
5     Vietnam          696              14
6    Thailand           64               0
7      Russia           20               0
8       Mongo           39               0
9     Germany            0              30
10     Canada           63             178
11     France            0              59
12  Australia           32              79
13   Pakistan            0              13
14    Another          337             365
> h1 <- hPlot(x="Country", y="foreign_wife", data=data, type=c("line"))
> h1
> h1 <- hPlot(x="Country", y="foreign_wife", data=data, type=c("bar"))
> h1
> h1 <- hPlot(x="Country", y="foreign_wife", data=data, type=c("pie"))
> h1
> h1 <- hPlot(x="Country", y="foreign_wife", data=data, type=c("scatter"))
> h1
> h1 <- hPlot(x="Country", y="foreign_wife", data=data, type=c("bubble"), size=3)
> h1
> h1 <- hPlot(x="Country", y="foreign_wife", data=data, type=c("area"))
> h1
> x1 <- xPlot(foreign_wife ~ Country, data=data, type="line-dotted")
> x1
> x1 <- xPlot(foreign_wife ~ Country, data=data, type="line")
> x1
> x1 <- xPlot(foreign_wife ~ Country, data=data, type="bar")
> x1
> x1 <- xPlot(foreign_wife ~ Country, data=data, type="cumulative")
> x1