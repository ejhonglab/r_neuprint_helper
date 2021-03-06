#!/usr/bin/env Rscript

# Follow instructions on neuprint website to generate this token, and copy it
# into the string here.
#Sys.setenv(NEUPRINT_APPLICATION_CREDENTIALS = "replace this")

# Note to self: copy contents of file "r_token_env_line" (NOT tracked by git)
# here to recreate one of my past attempts that seemed to at least set the
# token correctly.

library(reticulate)

use_virtualenv("./venv", required = TRUE)

util <- import("neuprint_helper.util")

out <- util$pn_kc_connections()

# Many ways the above can fail should result in some error output, with this
# line not being reached (but actually check a failure...)
print("reticulate interface to neuprint_helper seems to be working!")

# TODO do some check that above is reasonable (or better yet, call pytest tests
# after implementing some of them in neuprint_helper)

#virtualenv_create("r-reticulate")

# TODO make sure the below happens in a venv (or at least doesn't require sudo)
# Trying potentially unrelated solution from here:
# https://github.com/rstudio/reticulate/issues/578
# (see other discussion in the issue link if below fails)
#py_install("git+git://github.com/ejhonglab/neuprint_helper", pip = TRUE)
