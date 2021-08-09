import os
import json

import pytest

from publish.prepare import get_features, get_properties, is_type_iv, has_urinal


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
