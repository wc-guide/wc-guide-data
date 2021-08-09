import argparse
import json
import os

import requests

from publish.prepare import transform_geojson


def get_all_geojson_file_paths(folder_path):
    return [os.path.join(folder_path, file) for file in os.listdir(folder_path) if file.endswith(".geojson")]


def get_raw_data(file_path):
    with open(file_path) as json_file:
        return json.load(json_file)


def get_name(file_path):
    file_name = os.path.basename(file_path)
    return os.path.splitext(file_name)[0]


def prepare(folder_path):
    file_paths = get_all_geojson_file_paths(folder_path)
    path_and_data = [(file_path, get_raw_data(file_path)) for file_path in file_paths]
    result = []
    for path, raw_data in path_and_data:
        name = get_name(path)
        data = transform_geojson(raw_data)
        result.append((name, data))
    return result


def put_to_data(url, data, username, password):
    print("Put", url)
    return requests.put(url=url, auth=(username, password), json=data)


def publish(backend, data, username, password):
    for name, entry in data:
        url = f"{backend}/area/{name}/"
        response = put_to_data(url=url, data=data, username=username, password=password)
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
    folder_path = os.path.join(dir_path, args.relative_file_path)

    data = prepare(folder_path)
    publish(backend=args.backend, data=data, username=args.user, password=args.password)


if __name__ == "__main__":
    run()
