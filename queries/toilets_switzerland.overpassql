[out:json][timeout:9000];
(
//ganze Schweiz WC's
area["ISO3166-1"="CH"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;