[out:json][timeout:9000];
(
//WC's ganz Slowenien
area["ISO3166-1"="SI"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;