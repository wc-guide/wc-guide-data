[out:json][timeout:9000];
(
//WC's ganz Litauen
area["ISO3166-1"="LT"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;