[out:json][timeout:9000];
(
//ganz Deutschland WC's
area["ISO3166-1"="DE"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;
