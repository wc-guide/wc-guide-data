[out:json][timeout:9000];
(
//WC's ganz Malta
area["ISO3166-1"="MT"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;