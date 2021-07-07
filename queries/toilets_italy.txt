[out:json][timeout:9000];
(
//ganz Italien WC's
area["ISO3166-1"="IT"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;
