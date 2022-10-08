[out:json][timeout:9000];
(
//WC's ganz Belgien
area["ISO3166-1"="BE"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;