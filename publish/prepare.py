def get_features(data):
    return data.get('features', [])


def get_properties(feature):
    return feature.get('properties', {})


def get_type(properties):
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


def supports_male(properties):
    return properties.get("male", "no") == "yes"


def supports_female(properties):
    return properties.get("female", "no") == "yes"


def has_urinal(properties):
    return 'urinal' in properties.get('toilets:position', '')


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


def transform_feature(feature):
    properties = get_properties(feature)
    return {
        "type": "Feature",
        "id": get_osm_id(feature=feature),
        "geometry": get_geometry(feature=feature),
        "properties": {
            "type": get_type(properties=properties),
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
