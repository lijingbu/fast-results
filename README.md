# fast-results

## getGO.R
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



  
## getSeqbyID.pl
Grep sequences from a fasta file by given IDs (one ID per line) in a file.

Usage: `getSeqbyID.pl <seq> <ids> <out>`


## getSeqbyRegion.pl
Grep sequences from a tab separated file with regions information, one region per line.

Usage: `getSeqbyRegion.pl <genome> <regions> <out>`

**regions file format:**

chromosome | start | stop | strand | sequenceName
--- | --- | --- | --- | ---


**output fasta format:**

```
>sequenceName chromosome_start_stop_strand_length
MAGNSDNEIGNDMNMDNSD.....Sequences..
```

