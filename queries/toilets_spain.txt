[out:json][timeout:9000];
(
//ganz Spanien WC's
area["ISO3166-1"="ES"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;