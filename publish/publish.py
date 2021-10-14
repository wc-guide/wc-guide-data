import argparse
import json
import os

import requests


def get_features(data):
    return data.get('features', [])


def get_properties(feature):
    return feature.get('properties', {})


def get_type(properties):
    if is_type_eurokey_osm(properties):
        return 'eurokeyosm'
    if is_type_iv(properties):
        return 'iv'
    if is_type_pissoir(properties):
        return 'pissoir'
    return 'normal'


def is_type_pissoir(properties):
    is_urinal = has_urinal(properties)
    is_male = supports_male(properties)
    is_female = supports_female(properties)
    return is_urinal and is_male and not is_female


def is_type_eurokey_osm(properties):
    is_centralkey_eurokey = has_centralkey_eurokey(properties)
    is_wheelchair_description_eurokey = has_wheelchair_description_eurokey(properties)
    is_note_eurokey = has_note_eurokey(properties)
    return is_centralkey_eurokey or is_wheelchair_description_eurokey or is_note_eurokey


def supports_male(properties):
    return properties.get("male", "no") == "yes"


def supports_female(properties):
    return properties.get("female", "no") == "yes"


def has_centralkey_eurokey(properties):
    return properties.get("centralkey", "") == "eurokey"


def has_note_eurokey(properties):
    return properties.get("note", "") == "Eurokey"


def has_urinal(properties):
    return 'urinal' in properties.get('toilets:position', '')


def has_wheelchair_description_eurokey(properties):
    wheelchair_description = properties.get("wheelchair:description", "").lower()
    eurokey = "eurokey" in wheelchair_description
    euro_schluessel = "euro-schlüssel" in wheelchair_description
    euroschluessel = "euroschlüssel" in wheelchair_description
    return eurokey or euro_schluessel or euroschluessel


def is_type_iv(properties):
    return properties.get("wheelchair", "no") == "yes"


def has_access(properties):
    access = properties.get("access", "no")
    return access == "yes" or access == "public"


def has_changing_table(properties):
    return properties.get("changing_table", "no") == "yes"


def requires_fee(properties):
    return properties.get("fee", "no") == "yes"


def is_nette_toilette(properties):
    name = str(get_name(properties)).lower()
    description = str(get_description(properties)).lower()
    nette_toilette = 'nette toilette'
    return name == nette_toilette or description == nette_toilette


def get_name(properties):
    return properties.get("name", None)


def get_operator(properties):
    return properties.get("operator", None)


def get_description(properties):
    return properties.get("description", None)


def get_osm_id(feature):
    return feature.get("id", None)


def get_geometry(feature):
    return feature.get("geometry", None)


def get_line_string_center(coordinates):
    lon, lat = 0, 0
    for coordinate in coordinates:
        lon += coordinate[0]
        lat += coordinate[1]
    return [lon / len(coordinates), lat / len(coordinates)]


def get_polygon_center(coordinates):
    polygons = [get_line_string_center(polygon) for polygon in coordinates]
    return get_line_string_center(polygons)


def get_multipolygon_center(coordinates):
    polygons = [get_polygon_center(polygon) for polygon in coordinates]
    return get_line_string_center(polygons)


def geometry_to_point(geometry):
    geometry_type = str(geometry.get("type", None)).lower()
    coordinates = geometry.get("coordinates", None)
    if len(coordinates) == 0:
        return None

    if geometry_type == "point":
        return geometry
    if geometry_type == "linestring":
        return {
            "type": "Point",
            "coordinates": get_line_string_center(coordinates)
        }
    if geometry_type == "polygon":
        return {
            "type": "Point",
            "coordinates": get_polygon_center(coordinates)
        }
    if geometry_type == "multipolygon":
        return {
            "type": "Point",
            "coordinates": get_multipolygon_center(coordinates)
        }
    return None


def transform_feature(feature):
    properties = get_properties(feature)
    geometry = get_geometry(feature=feature)
    return {
        "type": "Feature",
        "geometry": geometry_to_point(geometry),
        "properties": {
            "type": get_type(properties=properties),
            "id": get_osm_id(feature=feature),
            "description": get_description(properties=properties),
            "name": get_name(properties=properties),
            "operator": get_operator(properties=properties),
            "access": has_access(properties=properties),
            "features":
                {
                    "wickeltisch": has_changing_table(properties=properties),
                    "kostenpflichtig": requires_fee(properties=properties),
                    "nettetoilette": is_nette_toilette(properties=properties)
                },
        }
    }


def transform_geojson(data):
    features = get_features(data=data)
    transformed_features = [transform_feature(feature) for feature in features]
    return {
        "type": "FeatureCollection",
        "features": transformed_features
    }


def get_all_geojson_file_paths(folder_path):
    return [os.path.join(folder_path, file) for file in os.listdir(folder_path) if file.endswith(".geojson")]


def get_raw_data(file_path):
    with open(file_path) as json_file:
        return json.load(json_file)


def get_publish_name(file_path):
    file_name = os.path.basename(file_path)
    file_name_without_extension = os.path.splitext(file_name)[0]
    return file_name_without_extension.split('_')[1]


def prepare(folder_path):
    file_paths = get_all_geojson_file_paths(folder_path)
    path_and_data = [(file_path, get_raw_data(file_path)) for file_path in file_paths]
    result = []
    for path, raw_data in path_and_data:
        name = get_publish_name(path)
        data = transform_geojson(raw_data)
        result.append((name, data))
    return result


def put_to_data(url, data, username, password):
    print("Put", url)
    return requests.put(url=url, auth=(username, password), json=data)


def publish(backend, data, username, password):
    for name, entry in data:
        is_not_empty = len(get_features(entry)) > 0
        is_not_us = str(name).lower() != "us"  # TODO: figure out how to deal with data amount of us
        if is_not_empty and is_not_us:
            url = f"{backend}/area/{name}/"
            response = put_to_data(url=url, data=entry, username=username, password=password)
            print("Response code", response.status_code)


def run():
    parser = argparse.ArgumentParser(description='Send GeoJSON to wc-guide-backend')
    parser.add_argument('-u', '--user', dest='user', type=str, required=True)
    parser.add_argument('-p', '--password', dest='password', type=str, required=True)
    parser.add_argument('-b', '--backend', dest='backend', type=str, required=True)
    parser.add_argument('-f', '--relative_folder_path', dest='relative_folder_path', type=str, required=True,
                        help='../data/')
    parser.add_argument('-n', '--name', dest='name', type=str, required=False, help='Name used as primary key')
    args = parser.parse_args()

    dir_path = os.path.dirname(os.path.realpath(__file__))
    folder_path = os.path.join(dir_path, args.relative_folder_path)

    data = prepare(folder_path)
    publish(backend=args.backend, data=data, username=args.user, password=args.password)


if __name__ == "__main__":
    run()
