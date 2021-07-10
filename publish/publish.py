import argparse
import json
import os

import requests


def get_data(file_path):
    with open(file_path) as json_file:
        return json.load(json_file)


def put_to_data(url, data, username, password):
    print("Put", url)
    return requests.put(url=url, auth=(username, password), json=data)


def run():
    parser = argparse.ArgumentParser(description='Send GeoJSON to wc-guide-backend')
    parser.add_argument('-u', '--user', dest='user', type=str, required=True)
    parser.add_argument('-p', '--password', dest='password', type=str, required=True)
    parser.add_argument('-b', '--backend', dest='backend', type=str, required=True)
    parser.add_argument('-f', '--relative_file_path', dest='relative_file_path', type=str, required=True,
                        help='../data/toilets_switzerland.geojson')
    parser.add_argument('-n', '--name', dest='name', type=str, required=False, help='Name used as primary key')
    args = parser.parse_args()

    dir_path = os.path.dirname(os.path.realpath(__file__))
    file_path = os.path.join(dir_path, args.relative_file_path)
    data = get_data(file_path)
    url = f"{args.backend}/area/{args.name}/"
    response = put_to_data(url=url, data=data, username=args.user, password=args.password)
    print("Response code", response.status_code)


if __name__ == "__main__":
    run()
