[out:json][timeout:9000];
(
//ganz Österreich WC's
area["ISO3166-1"="AT"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;