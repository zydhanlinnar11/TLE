#!/bin/bash

# Get to a predictable directory, the directory of this script
cd "$(dirname "$0")"

[ -e environment ] && . ./environment

apt-get update
apt-get install -y gir1.2-pango-1.0 sqlite3
FONTCONFIG_FILE=$PWD/extra/fonts.conf python -m tle