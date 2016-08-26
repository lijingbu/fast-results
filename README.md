# fast-results

##getGO.R
Get the ancestor of given level for given GO term.  

Install required R packages
```
source("https://bioconductor.org/biocLite.R")
biocLite("BiocUpgrade")     ## R version 2.15 or later
biocLite("GOstats")
biocLite("annotate")
```
**Usage:** `Rscript --vanilla getGO.R <your_GO_ID> <level>`  
**Example:** `Rscript --vanilla getGO.R GO:0000007 3`  
**Output file:** anc_GO:0000007.txt  
GO:0000007      MF      GO:0022857      transmembrane transporter activity



  
##getSeqbyIDs.pl
Grep sequences from a fasta file by given IDs (one ID per line) in a file.

Usage: `getSeqbyID.pl <seq> <ids> <out>`

