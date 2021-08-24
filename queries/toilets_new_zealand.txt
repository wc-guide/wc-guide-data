[out:json][timeout:9000];
(
//WC's ganz Neuseeland
area["ISO3166-1"="NZ"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;