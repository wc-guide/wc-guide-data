[out:json][timeout:9000];
(
//WC's ganz Japan
area["ISO3166-1"="JP"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;