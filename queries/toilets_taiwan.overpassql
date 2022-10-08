[out:json][timeout:9000];
(
//ganze Taiwan WC's
area["ISO3166-1"="TW"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;