#!/bin/bash

python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt

python myblink.py

# Keep container running if app stops so we can debug
tail -f /dev/null