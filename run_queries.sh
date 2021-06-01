#!/bin/bash

set -e
set -o pipefail

function cleanup {
  exit $?
}
trap "cleanup" EXIT

DIR="$(cd "$(dirname "$0")" && pwd)"

# WC's ganze Schweiz

echo -ne "Query WC's ganze Schweiz...           "
cat $DIR/queries/toilets_switzerland.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_switzerland.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Deutschland

echo -ne "Query WC's ganz Deutschland...           "
cat $DIR/queries/toilets_germany.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_germany.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's weltweit

#echo -ne "Query WC's weltweit...           "
#cat $DIR/queries/toilets_worldwide.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_worldwide.geojson
#echo -ne "\t\t - Done.\r"
#echo ""