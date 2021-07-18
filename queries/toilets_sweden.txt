[out:json][timeout:9000];
(
//WC's ganz Schweden
area["ISO3166-1"="SE"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;