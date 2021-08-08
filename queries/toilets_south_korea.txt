[out:json][timeout:9000];
(
//ganz Südkorea WC's
area["ISO3166-1"="KR"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;