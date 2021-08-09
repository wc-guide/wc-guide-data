import argparse
import json
import os


def get_features(data):
    return data.get('features', [])


def get_properties(feature):
    return feature.get('properties', {})


def get_type(properties):
    result = 'normal'


def supports_male(properties):
    return properties.get("male", "no") == "yes"


def supports_female(properties):
    return properties.get("female", "no") == "yes"


def has_urinal(properties):
    return 'urinal' in properties.get('toilets:position', '')


def is_type_iv(properties):
    return properties.get("wheelchair", "no") == "yes"


def create_feature(facility):
    lon = facility['Standort']['X']
    lat = facility['Standort']['Y']
    operator = facility['Betreiber']['Name']
    return {
        "type": "Feature",
        "id": None,
        "geometry": {
            "type": "Point",
            "coordinates": [float(lon), float(lat)]
        },
        "properties": {
            "type": "eurokey",
            "description": None,
            "fee": None,
            "name": None,
            "operator": operator,
            "access": False,
            "features":
                {
                    "wickeltisch": False,
                    "kostenpflichtig": False,
                    "nettetoilette": False
                },
        }
    }
