import os
import json

import pytest

from publish.publish import get_features, get_properties, is_type_iv, has_urinal, supports_female, supports_male, \
    is_type_pissoir, get_type, get_osm_id, get_geometry, get_description, has_access, get_name, get_operator, \
    requires_fee, has_changing_table, is_nette_toilette, get_line_string_center, get_polygon_center, \
    get_multipolygon_center


@pytest.fixture
def data():
    dir_path = os.path.dirname(os.path.realpath(__file__))
    file_path = os.path.join(dir_path, 'osm_test.geojson')
    with open(file_path) as json_file:
        return json.load(json_file)


def test_get_features(data):
    features = get_features(data)
    assert len(features) > 0


def test_get_properties(data):
    features = get_features(data)
    properties = []
    for feature in features:
        properties += get_properties(feature)
    assert len(properties) > 0


def has_property(raw_data, check_fun):
    features = get_features(raw_data)
    has_prop = False
    for feature in features:
        properties = get_properties(feature)
        has_prop = check_fun(properties)
        if has_prop:
            break
    return has_prop


def test_is_type_iv(data):
    assert has_property(data, is_type_iv)


def test_has_urinal(data):
    assert has_property(data, has_urinal)


def test_requires_fee(data):
    assert has_property(data, requires_fee)


def test_supports_female(data):
    assert has_property(data, supports_female)


def test_supports_male(data):
    assert has_property(data, supports_male)


def test_has_access(data):
    assert has_property(data, has_access)


def test_is_type_pissoir(data):
    assert has_property(data, is_type_pissoir)


def test_has_changing_table(data):
    assert has_property(data, has_changing_table)


def test_is_nette_toilette(data):
    assert has_property(data, is_nette_toilette)


def test_get_type(data):
    features = get_features(data)
    types = []
    for feature in features:
        properties = get_properties(feature)
        types.append(get_type(properties))
    different_types = ['iv', 'normal', 'pissoir']
    for different_type in different_types:
        assert different_type in types


def get_feature_list(raw_data, property_fun):
    features = get_features(raw_data)
    properties = []
    for feature in features:
        properties.append(property_fun(feature))
    return properties


def get_property_list(raw_data, property_fun):
    features = get_features(raw_data)
    result = []
    for feature in features:
        properties = get_properties(feature)
        prop = property_fun(properties)
        if prop:
            result.append(prop)
    return result


def test_get_osm_id(data):
    osm_ids = get_feature_list(data, get_osm_id)

    assert len(osm_ids) > 0
    assert None not in osm_ids


def test_get_geometry(data):
    geometries = get_feature_list(data, get_geometry)

    assert len(geometries) > 0
    assert None not in geometries


def test_get_description(data):
    descriptions = get_property_list(data, get_description)

    assert len(descriptions) > 0


def test_get_name(data):
    names = get_property_list(data, get_name)

    assert len(names) > 0


def test_get_operator(data):
    operators = get_property_list(data, get_operator)

    assert len(operators) > 0


def test_get_line_string_center():
    line_string = {
        "type": "LineString",
        "coordinates": [
            [30.0, 10.0], [10.0, 30.0], [20.0, 20.0]
        ]
    }
    center = get_line_string_center(line_string['coordinates'])

    assert center == [20.0, 20.0]


def test_get_polygon_center():
    polygon = {
        "type": "Polygon",
        "coordinates": [
            [[30.0, 10.0], [60.0, 40.0], [20.0, 40.0], [10.0, 0.0], [30.0, 10.0]]
        ]
    }
    center = get_polygon_center(polygon['coordinates'])

    assert center == [30.0, 20.0]


def test_get_multipolygon_center():
    multipolygon = {
        "type": "MultiPolygon",
        "coordinates": [
            [
                [[40.0, 40.0], [20.0, 40.0], [40.0, 30.0], [40.0, 30.0]]  # 140, 140
            ],
            [
                [[40.0, 40.0], [20.0, 40.0], [40.0, 30.0], [40.0, 30.0]],  # 140, 140
                [[40.0, 40.0], [20.0, 40.0], [40.0, 30.0], [40.0, 30.0]]   # 140, 140
            ]
        ]
    }
    center = get_multipolygon_center(multipolygon['coordinates'])
    assert center == [35.0, 35.0]
