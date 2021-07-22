[out:json][timeout:9000];
(
//WC's ganz Grossbritannien
area["ISO3166-1"="GB"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;