[out:json][timeout:9000];
(
//WC's ganz Dänemark
area["ISO3166-1"="DK"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;