# install.packages("mitml")
# install.packages("lavaan")
# install.packages("remotes")
# remotes::install_github("bkeller2/fdir")

# load mitml
library(mitml)

# set working directory
fdir::set()

# 20 imputed data sets stacked in a file called imps.dat
# folder with imputed data must be in the same folder as this script
imps <- read.table("./imps/imps.dat")
names(imps) <- c("imputation", "id", "txgrp", "male", "age", "edugroup", "workhrs", "exercise", "paingrps", 
                "pain", "anxiety", "stress", "control", "depress", "interfere", "disability",
                paste0("dep", seq(1:7)), paste0("int", seq(1:6)), paste0("dis", seq(1:6)))

# analysis and pooling with mitml package
implist <- as.mitml.list(split(imps, imps$imputation))
analysis <- with(implist, lm(depress ~  interfere + control + pain + age + txgrp))
testEstimates(analysis, extra.pars = T, df.com = 269)
