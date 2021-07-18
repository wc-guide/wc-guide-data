[out:json][timeout:9000];
(
//WC's ganz Kanada
area["ISO3166-1"="CA"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;