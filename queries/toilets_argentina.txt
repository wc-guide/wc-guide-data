[out:json][timeout:9000];
(
//ganz Argentinien WC's
area["ISO3166-1"="AR"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;