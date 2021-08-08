[out:json][timeout:9000];
(
//ganz China WC's
area["ISO3166-1"="CN"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;