
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

> install.packages("ggplot2")
Warning in install.packages :
  downloaded length 227 != reported length 227
Installing package into ‘C:/Users/codedragon/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
also installing the dependencies ‘colorspace’, ‘Rcpp’, ‘stringr’, ‘RColorBrewer’, ‘dichromat’, ‘munsell’, ‘labeling’, ‘plyr’, ‘digest’, ‘gtable’, ‘reshape2’, ‘scales’, ‘proto’

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/colorspace_1.2-4.zip'
Content type 'application/zip' length 384011 bytes (375 Kb)
opened URL
downloaded 375 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/Rcpp_0.11.4.zip'
Content type 'application/zip' length 3147585 bytes (3.0 Mb)
opened URL
downloaded 3.0 Mb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/stringr_0.6.2.zip'
Content type 'application/zip' length 75215 bytes (73 Kb)
opened URL
downloaded 73 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/RColorBrewer_1.1-2.zip'
Content type 'application/zip' length 26682 bytes (26 Kb)
opened URL
downloaded 26 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/dichromat_2.0-0.zip'
Content type 'application/zip' length 147694 bytes (144 Kb)
opened URL
downloaded 144 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/munsell_0.4.2.zip'
Content type 'application/zip' length 126110 bytes (123 Kb)
opened URL
downloaded 123 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/labeling_0.3.zip'
Content type 'application/zip' length 40878 bytes (39 Kb)
opened URL
downloaded 39 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/plyr_1.8.1.zip'
Content type 'application/zip' length 1151319 bytes (1.1 Mb)
opened URL
downloaded 1.1 Mb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/digest_0.6.8.zip'
Content type 'application/zip' length 151920 bytes (148 Kb)
opened URL
downloaded 148 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/gtable_0.1.2.zip'
Content type 'application/zip' length 63945 bytes (62 Kb)
opened URL
downloaded 62 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/reshape2_1.4.1.zip'
Content type 'application/zip' length 499055 bytes (487 Kb)
opened URL
downloaded 487 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/scales_0.2.4.zip'
Content type 'application/zip' length 152552 bytes (148 Kb)
opened URL
downloaded 148 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/proto_0.3-10.zip'
Content type 'application/zip' length 458519 bytes (447 Kb)
opened URL
downloaded 447 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/ggplot2_1.0.0.zip'
Content type 'application/zip' length 2674611 bytes (2.6 Mb)
opened URL
downloaded 2.6 Mb

package ‘colorspace’ successfully unpacked and MD5 sums checked
package ‘Rcpp’ successfully unpacked and MD5 sums checked
package ‘stringr’ successfully unpacked and MD5 sums checked
package ‘RColorBrewer’ successfully unpacked and MD5 sums checked
package ‘dichromat’ successfully unpacked and MD5 sums checked
package ‘munsell’ successfully unpacked and MD5 sums checked
package ‘labeling’ successfully unpacked and MD5 sums checked
package ‘plyr’ successfully unpacked and MD5 sums checked
package ‘digest’ successfully unpacked and MD5 sums checked
package ‘gtable’ successfully unpacked and MD5 sums checked
package ‘reshape2’ successfully unpacked and MD5 sums checked
package ‘scales’ successfully unpacked and MD5 sums checked
package ‘proto’ successfully unpacked and MD5 sums checked
package ‘ggplot2’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\codedragon\AppData\Local\Temp\RtmpmCHSpa\downloaded_packages
> library(ggplot2)
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
> ggplot2 <- ggplot(data, aes(x=Country, y=foreign_wife))
> ggplot2 + geom_bar(stat="identity")
> sum <- rowSums(data[, c(2,3)])
> sum
 [1]  592 2323  792  292  710   64   20   39   30  241   59
[12]  111   13  702
> ggplot2_sum <- ggplot(data, aes(x=Country, y=sum))
> ggplot2_sum + geom_bar(stat = "identity")
> ggplot2_sum + geom_bar(stat="identity", color="black", fill="yellow")
> ggplot2_sum + geom_bar(stat="identity", color="red", fill="white") + theme(axis.text.x=element_text(angle=90, size=10, vjust=0.3))
>