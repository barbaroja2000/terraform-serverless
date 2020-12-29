import json
import boto3
import json
import datetime

from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.core import patch

libraries = (['boto3'])
patch(libraries)


client = boto3.client("events")


def event_bridge(event):

    print(event)
    response = client.put_events(
    Entries=[
        {
            "Time": datetime.datetime.now(),
            "Source": "virtual_racing.dispatch",
            "Resources": [
                "string",
            ],
            "DetailType": "Immediate",
            "Detail": '{"yes":"mate"}'
        },
    ]
)
    return response


def hello(event, context):

    eb =  event_bridge(event)

    response =   {
        "isBase64Encoded": False,
        "statusCode": 200,
        "headers": {},
        "body":  json.dumps(eb)
    }

    return response