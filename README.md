# WC Guide Data

![Get data from Overpass](https://github.com/chnuessli/defi_archive/workflows/Get%20data%20from%20Overpass/badge.svg)

![WC-Guide Logo](img/wc-guide-logo.svg)

Sammlung von JSON Files für den WC-Guide

Die Daten können hier bezogen werden: [`data` Verzeichnis](https://github.com/chnuessli/wc-guide-data/tree/main/data)
**Wichtig**
Die Daten sind direkt aus OSM exportiert.

## Sinn und Zweck

Sinn dieses Repo ist es, Datenveränderungen täglich nachzuvollziehen. Täglich wird nun automatisiert ein GeoJSON generiert und somit Datenveränderungen dokumentiert.
Die JSON Datensammlung soll stetig wachsen und so ein sauberes Archiv generieren.

## Overpass Abfragen via Overpass API

Die Abfragen sind immer gleich aufgebaut, hier ein paar Beispiele. Für alle Abfragen besuche bitte die TXT Files. Die TXT Files dazu findet man in `queries`.

Umgebaute Queries die mit der Overpass API korrespondieren können.

<details><summary>Abfragen ausklappen</summary>
<p>

## WC

### Schweiz

```json
[out:json][timeout:25];
(
//ganze Schweiz 24h Defis
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
```

</p>
</details>

## Automation

In diesem Repository sind GitHub Actions eingerichtet, um täglich aktuelle Daten via [Overpass API](https://wiki.openstreetmap.org/wiki/Overpass_API) abzufragen und als GeoJSON abzulegen.

* Die aktuelle GeoJSON-Dateien sind im [`data` Verzeichnis](https://github.com/Schutz-Rettung-Zurich/json-archive/tree/main/data)
* Die GitHub Actions sind im [`overpass.yml`](https://github.com/Schutz-Rettung-Zurich/json-archive/blob/main/.github/workflows/overpass.yml) Workflow beschrieben
* Der Workflow verwendet das Skript [`run_queries.sh`](https://github.com/Schutz-Rettung-Zurich/json-archive/blob/main/run_queries.sh) um alle Queries laufen zu lassen
* Jedes Overpass-Query ist in einer eigenen Datei im [Verzeichnis `queries`](https://github.com/Schutz-Rettung-Zurich/json-archive/tree/main/queries) abgelegt

### Neues Query hinzufügen

Um ein neues Query hinzuzufügen, müssen folgende Schritte befolgt werden:

1. Query schreiben und via http://overpass-turbo.osm.ch/ testen. **ACHTUNG:** es ist nur die Overpass Query Syntax unterstützt, **keine [Overpass Turbo Shortcuts](https://wiki.openstreetmap.org/wiki/Overpass_turbo/Extended_Overpass_Turbo_Queries)** (z.B. ` {{geocodeArea:CH-ZH}}`)
1. Query als neue Datei in [`queries` Verzeichnis](https://github.com/Schutz-Rettung-Zurich/json-archive/tree/main/queries) ablegen
1. Neues Query in [`run_queries.sh`](https://github.com/Schutz-Rettung-Zurich/json-archive/blob/main/run_queries.sh) aufrufen

### Datenübergabe ans Backend

Die Daten können per script ans Backend gesendet werden, siehe folgendes Beispiel:
```bash
python publish/publish.py -u <username> -p <password> -b <backend_url> -n <name> -f <relativ_directory_path>
```

Für jede GeoJSON-Datei im `relativ_directory_path` wird eine Area im Backend erstellt.
Der Namen der Area wird als eindeutige Id verwendet, damit ein Update von Areas möglich ist.
Dafür wird der GeoJSON-Dateinamen beispielsweise wie folgt verwendet:  

Dateinamen: `toilets_switzerland.geojson` -> Area: `switzerland` 

