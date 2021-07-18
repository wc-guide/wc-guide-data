[out:json][timeout:9000];
(
//WC's ganz Slowakei
area["ISO3166-1"="SK"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;