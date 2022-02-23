[out:json][timeout:12000];
(
//ganz Frankreich WC's
area["ISO3166-1"="FR"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;
