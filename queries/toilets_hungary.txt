[out:json][timeout:9000];
(
//WC's ganz Ungarn
area["ISO3166-1"="HU"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;