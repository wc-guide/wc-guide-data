[out:json][timeout:9000];
(
//WC's ganz Island
area["ISO3166-1"="IS"];
)->.searchArea;
// gather results
(
nwr["amenity"="toilets"](area.searchArea);
);
// print results
out body;
>;
out skel qt;