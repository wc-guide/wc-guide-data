[out:json][timeout:9000];
(
//WC's ganz Griechenland
area["ISO3166-1"="EL"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;