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

# WC's ganz Österreich

echo -ne "Query WC's ganz Österreich...           "
cat $DIR/queries/toilets_austria.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_austria.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Italien

echo -ne "Query WC's ganz Italien...           "
cat $DIR/queries/toilets_italy.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_italy.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Frankreich

echo -ne "Query WC's ganz Frankreich...           "
cat $DIR/queries/toilets_france.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_france.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Spanien

echo -ne "Query WC's ganz Spanien...           "
cat $DIR/queries/toilets_spain.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_spain.geojson
echo -ne "\t\t - Done.\r"
echo ""

-------
# WC's weltweit

#echo -ne "Query WC's weltweit...           "
#cat $DIR/queries/toilets_worldwide.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_worldwide.geojson
#echo -ne "\t\t - Done.\r"
#echo ""