[out:json][timeout:9000];
(
//ganz Brasilien WC's
area["ISO3166-1"="BR"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;