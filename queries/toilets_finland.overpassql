[out:json][timeout:9000];
(
//WC's ganz Finnland
area["ISO3166-1"="FI"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;