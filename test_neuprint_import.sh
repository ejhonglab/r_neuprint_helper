#!/usr/bin/env bash

read -p "activate ./venv first? (y/n)" -n 1 -r
echo # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # (or the correct path, elsewhere)
    source ./venv/bin/activate
fi
python3 -c 'import neuprint_helper.util as u'
