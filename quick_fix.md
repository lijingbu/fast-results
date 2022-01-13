# Quick fix solutions for troubles

#### Package ‘XXX’ was installed before R 4.0.0: please re-install it
Copied from [source](https://stackoverflow.com/questions/63390194/package-xxx-was-installed-before-r-4-0-0-please-re-install-it).

##### check your package library path 
.libPaths()

##### grab old packages names
old_packages <- installed.packages(lib.loc = "/Library/Frameworks/R.framework/Versions/3.6/Resources/library")
old_packages <- as.data.frame(old_packages)
list.of.packages <- unlist(old_packages$Package)

##### remove old packages 
remove.packages( installed.packages( priority = "NA" )[,1] )

##### reinstall all packages 
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
lapply(list.of.packages,function(x){library(x,character.only=TRUE)})
