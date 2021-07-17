[out:json][timeout:9000];
(
//WC's ganz Bulgarien
area["ISO3166-1"="BG"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;