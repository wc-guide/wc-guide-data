[out:json][timeout:9000];
(
//ganz Australien WC's
area["ISO3166-1"="AU"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;