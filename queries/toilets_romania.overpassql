[out:json][timeout:9000];
(
//WC's ganz Rumänien
area["ISO3166-1"="RO"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;