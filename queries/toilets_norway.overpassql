[out:json][timeout:9000];
(
//WC's ganz Norwegen
area["ISO3166-1"="NO"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;