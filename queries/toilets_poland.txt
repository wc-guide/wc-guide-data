[out:json][timeout:9000];
(
//WC's ganz Polen
area["ISO3166-1"="PL"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;