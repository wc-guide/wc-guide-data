[out:json][timeout:9000];
(
//ganze Marocco WC's
area["ISO3166-1"="MA"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;
