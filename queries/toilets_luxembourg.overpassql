[out:json][timeout:9000];
(
//WC's ganz Luxembrug
area["ISO3166-1"="LU"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;