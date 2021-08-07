#!/bin/bash

set -e
set -o pipefail

function cleanup {
  exit $?
}
trap "cleanup" EXIT

DIR="$(cd "$(dirname "$0")" && pwd)"

# WC's ganz Australien

echo -ne "Query Toiletten ganz Australien...           "
cat $DIR/queries/toilets_australia.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_australia.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Österreich

echo -ne "Query Toiletten ganz Oesterreich...           "
cat $DIR/queries/toilets_austria.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_austria.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Belgien

echo -ne "Query Toiletten ganz Belgien...           "
cat $DIR/queries/toilets_belgium.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_belgium.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Bulgarien

echo -ne "Query Toiletten ganz Bulgarien...           "
cat $DIR/queries/toilets_bulgary.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_bulgary.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Kanada

echo -ne "Query Toiletten ganz Kanada...           "
cat $DIR/queries/toilets_canada.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_canada.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Kroatien

echo -ne "Query Toiletten ganz Kroatien...           "
cat $DIR/queries/toilets_croatia.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_croatia.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Zypern

echo -ne "Query Toiletten ganz Zypern...           "
cat $DIR/queries/toilets_cyprus.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_cyprus.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Tschechien

echo -ne "Query Toiletten ganz Tschechien...           "
cat $DIR/queries/toilets_czech.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_czech.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Dänemark

echo -ne "Query Toiletten ganz Dänemark...           "
cat $DIR/queries/toilets_denmark.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_denmark.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Estland

echo -ne "Query Toiletten ganz Estland...           "
cat $DIR/queries/toilets_estland.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_estland.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Finnland

echo -ne "Query Toiletten ganz Finnland...           "
cat $DIR/queries/toilets_finland.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_finland.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Frankreich

echo -ne "Query Toiletten ganz Frankreich...           "
cat $DIR/queries/toilets_france.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_france.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Deutschland

echo -ne "Query Toiletten ganz Deutschland...           "
cat $DIR/queries/toilets_germany.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_germany.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Griechenland

echo -ne "Query Toiletten ganz Griechenland...           "
cat $DIR/queries/toilets_greece.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_greece.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Ungarn

echo -ne "Query Toiletten ganz Ungarn...           "
cat $DIR/queries/toilets_hungary.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_hungary.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Island

echo -ne "Query Toiletten ganz Island...           "
cat $DIR/queries/toilets_iceland.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_iceland.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Irland

echo -ne "Query Toiletten ganz Irland...           "
cat $DIR/queries/toilets_ireland.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_ireland.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Italien

echo -ne "Query Toiletten ganz Italien...           "
cat $DIR/queries/toilets_italy.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_italy.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Lettland

echo -ne "Query Toiletten ganz Lettland...           "
cat $DIR/queries/toilets_latvia.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_latvia.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Liechtenstein

echo -ne "Query Toiletten ganz Liechtenstein...           "
cat $DIR/queries/toilets_liechtenstein.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_liechtenstein.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Lithauen

echo -ne "Query Toiletten ganz Lithauen...           "
cat $DIR/queries/toilets_lithuania.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_lithuania.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Luxemburg

echo -ne "Query Toiletten ganz Luxemburg...           "
cat $DIR/queries/toilets_luxembourg.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_luxembourg.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Malta

echo -ne "Query Toiletten ganz Malta...           "
cat $DIR/queries/toilets_malta.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_malta.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Mexico

echo -ne "Query Toiletten ganz Mexiko...           "
cat $DIR/queries/toilets_mexico.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_mexico.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Holland

echo -ne "Query Toiletten ganz Holland...           "
cat $DIR/queries/toilets_niederlande.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_niederlande.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Norwegen

echo -ne "Query Toiletten ganz Norwegen...           "
cat $DIR/queries/toilets_norway.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_norway.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Polen

echo -ne "Query Toiletten ganz Polen...           "
cat $DIR/queries/toilets_poland.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_poland.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Portugal

echo -ne "Query Toiletten ganz Portugal...           "
cat $DIR/queries/toilets_portugal.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_portugal.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Rumänien

echo -ne "Query Toiletten ganz Rumänien...           "
cat $DIR/queries/toilets_romania.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_romania.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Slowakei

echo -ne "Query Toiletten ganz Slowakei...           "
cat $DIR/queries/toilets_slovakia.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_slovakia.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Slowenien

echo -ne "Query Toiletten ganz Slowenien...           "
cat $DIR/queries/toilets_slovenia.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_slovenia.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Spanien

echo -ne "Query Toiletten ganz Spanien...           "
cat $DIR/queries/toilets_spain.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_spain.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganz Schweden

echo -ne "Query Toiletten ganz Schweden...           "
cat $DIR/queries/toilets_sweden.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_sweden.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganze Schweiz

echo -ne "Query Toiletten ganze Schweiz...           "
cat $DIR/queries/toilets_switzerland.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_switzerland.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganzes Vereinigtes Königreich

echo -ne "Query Toiletten ganzes Vereinigtes Königreich...           "
cat $DIR/queries/toilets_gb.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_gb.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's ganze USA

echo -ne "Query Toiletten ganze USA...           "
cat $DIR/queries/toilets_us.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_us.geojson
echo -ne "\t\t - Done.\r"
echo ""

# WC's weltweit

#echo -ne "Query WC's weltweit...           "
#cat $DIR/queries/toilets_worldwide.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/toilets_worldwide.geojson
#echo -ne "\t\t - Done.\r"
#echo ""