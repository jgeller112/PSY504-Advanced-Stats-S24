# install.packages("mitml")
# install.packages("lavaan")
# install.packages("remotes")
# remotes::install_github("bkeller2/fdir")

# load lavaan
library(lavaan)

# set working directory
fdir::set()

# raw data must be in the same folder as this script
dat <- read.table("pain.dat", na.strings = "999")
names(dat) <- c("id", "txgrp", "male", "age", "edugroup", "workhrs", "exercise", "paingrps", 
                "pain", "anxiety", "stress", "control", "depress", "interfere", "disability",
                paste0("dep", seq(1:7)), paste0("int", seq(1:6)), paste0("dis", seq(1:6)))

# specify lavaan model
model <- 'depress ~  interfere + control + pain + age + txgrp'

# estimate model in lavaan
# note that lavaan applies the normality assumption to the binary predictors
fit <- sem(model, dat, fixed.x = F, missing = "fiml")
inspectSampleCov(model, dat, meanstructure = T, fixed.x = F, missing = "fiml")
summary(fit, rsquare = T, standardize = T)

