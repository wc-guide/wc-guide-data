#!/bin/bash

set -e
set -o pipefail

function cleanup {
  exit $?
}
trap "cleanup" EXIT

DIR="$(cd "$(dirname "$0")" && pwd)"

# WC's ganze Schweiz

echo -ne "Query Toiletten ganze Schweiz...           "
cat $DIR/queries/toilets_switzerland.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_switzerland.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Deutschland

echo -ne "Query Toiletten ganz Deutschland...           "
cat $DIR/queries/toilets_germany.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_germany.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Österreich

echo -ne "Query Toiletten ganz Oesterreich...           "
cat $DIR/queries/toilets_austria.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_austria.geojson
echo -ne "\t\t - Done.\r"
echo ""

