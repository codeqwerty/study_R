
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
> install.packages("RColorBrewer")
Installing package into ‘C:/Users/yuriyuri/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/RColorBrewer_1.1-2.zip'
Content type 'application/zip' length 26682 bytes (26 Kb)
opened URL
downloaded 26 Kb

Warning in install.packages :
  downloaded length 26682 != reported length 26682
package ‘RColorBrewer’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\yuriyuri\AppData\Local\Temp\RtmpK0gvpU\downloaded_packages
> install.packages("wordcloud")
Installing package into ‘C:/Users/yuriyuri/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
also installing the dependency ‘slam’

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/slam_0.1-32.zip'
Content type 'application/zip' length 111549 bytes (108 Kb)
opened URL
downloaded 108 Kb

trying URL 'http://cran.rstudio.com/bin/windows/contrib/3.1/wordcloud_2.5.zip'
Content type 'application/zip' length 466690 bytes (455 Kb)
opened URL
downloaded 455 Kb

package ‘slam’ successfully unpacked and MD5 sums checked
package ‘wordcloud’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\yuriyuri\AppData\Local\Temp\RtmpK0gvpU\downloaded_packages
> library(wordcloud)
필요한 패키지를 로딩중입니다: RColorBrewer
> library(RColorBrewer)
> wordcloud(data[,1], data[,3], colors=brewer.pal(8, "Dark2"))
> wordcloud(data[,1], data[,3], colors=brewer.pal(8, "Accent"))
> wordcloud(data[,1], data[,3], colors=brewer.pal(12, "Paired"))
> wordcloud(data[,1], data[,3], colors=brewer.pal(9, "Pastel1"))
> wordcloud(data[,1], data[,3], colors=brewer.pal(8, "Pastel2"))
> wordcloud(data[,1], data[,3], colors=brewer.pal(9, "Set1"))
> wordcloud(data[,1], data[,3], colors=brewer.pal(8, "Set2"))
> 