mouse (developmental repo)
===============================================================================

[![Travis-CI Build Status](https://travis-ci.org/kaz-yos/mouse.svg?branch=develop)](https://travis-ci.org/kaz-yos/mouse)

**An R package to facilitate within cluster resampling**

This package facilitates within-cluster resampling (a.k.a. multiple outputation)


mouse code example
-------------------------------------------------------------------------------


```

> ## Load package
> library(mouse)
> ## Load data

```


Installation
-------------------------------------------------------------------------------

<!-- This version of tableone package for R is developmetal, and may not be available from the CRAN. You can install it using one of the following way. -->

**Direct installation from github**

You first need to install the devtools package to do the following. You can choose from the latest stable version and the latest development version.

```

## Install devtools (if you do not have it already)
> install.packages("devtools")
## Install directly from github (develop branch)
> devtools::install_github(repo = "kaz-yos/mouse", ref = "develop")

```

Using devtools may requires some preparation, please see the following link for information.

http://www.rstudio.com/projects/devtools/
