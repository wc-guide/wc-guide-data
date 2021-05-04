#!/bin/bash

set -e
set -o pipefail

function cleanup {
  exit $?
}
trap "cleanup" EXIT

DIR="$(cd "$(dirname "$0")" && pwd)"

# Schweiz

# WC's ganze Schweiz

echo -ne "Query WC's ganze Schweiz...           "
cat $DIR/queries/wc_switzerland.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/wc_switzerland.geojson
echo -ne "\t\t - Done.\r"
echo ""
