#!/usr/bin/env bash

# Dependencies:
# - python3
# - python3 pip
# - reticulate (R package)
#   (install_r.sh shows how I installed reticulate, on the last line)

# TODO automate dependency install in mac + ubuntu way (from fresh machines in
# both cases)

# could use this if venv stuff isn't working in reticulate
# replace everything below with just this commented line in that case
# (except for the last line starting with "echo")
#python3 -m pip install git+git://github.com/ejhonglab/neuprint_helper --user

if [ -d "./venv" ]; then
    echo "Removing the directory ./venv (<Ctrl>-c to abort)..."
    rm -rfI ./venv
fi
python3 -m venv venv
# TODO test this is correct location on mac too
source ./venv/bin/activate

# Using just `python` here, rather than `python3`, because the former is what
# the virtual environment will change
python -m pip install git+git://github.com/ejhonglab/neuprint_helper
