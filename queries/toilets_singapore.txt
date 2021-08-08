[out:json][timeout:9000];
(
//ganz Singapur
area["ISO3166-1"="SG"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;