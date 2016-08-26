#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
}

library("GOstats")
library("annotate")

getMFAnc <- function(interm, goLevel){
  for (i in as.list(GOMFANCESTOR)[interm][[1]] ){
    numParents <- length(as.list(GOMFANCESTOR)[i][[1]])
    if (numParents == goLevel) {
      return(i)
    }
  }
}

getBPAnc <- function(interm, goLevel){
  for (i in as.list(GOBPANCESTOR)[interm][[1]] ){
    numParents <- length(as.list(GOBPANCESTOR)[i][[1]])
    if (numParents == goLevel) {
      return(i)
    }
  }
}

getCCAnc <- function(interm, goLevel){
  for (i in as.list(GOCCANCESTOR)[interm][[1]] ){
    numParents <- length(as.list(GOCCANCESTOR)[i][[1]])
    if (numParents == goLevel) {
      return(i)
    }
  }
}

getAnyAnc <- function(x, goLevel){
  mytype <- getGOOntology(x)
  myAncestor <- switch(mytype,
                       MF = getMFAnc(x, goLevel),
                       BP = getBPAnc(x, goLevel),
                       CC = getCCAnc(x, goLevel))
  myAncName <- as.character(try(getGOTerm(myAncestor), silent = T))
  as.vector(c(x, mytype, myAncestor, myAncName))
}
anc <- getAnyAnc(args[1], 3)
anc <- rbind(anc)
write.table(anc,file=paste0("anc_", args[1], ".txt"),row.names=F, sep="\t", quote = F, col.names = F)
