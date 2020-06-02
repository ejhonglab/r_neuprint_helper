#!/usr/bin/env Rscript

# Follow instructions on neuprint website to generate this token, and copy it
# into the string here.
#Sys.setenv(NEUPRINT_APPLICATION_CREDENTIALS = "replace this")

library(reticulate)

use_virtualenv("./venv", required = TRUE)

util <- import("neuprint_helper.util")

out <- util$pn_kc_connections()

#virtualenv_create("r-reticulate")

# TODO make sure the below happens in a venv (or at least doesn't require sudo)
# Trying potentially unrelated solution from here:
# https://github.com/rstudio/reticulate/issues/578
# (see other discussion in the issue link if below fails)
#py_install("git+git://github.com/ejhonglab/neuprint_helper", pip = TRUE)
