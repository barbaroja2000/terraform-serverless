import json
import requests
import os

from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.core import patch


libraries = (['boto3'])
patch(libraries)

def hello(event, context):

    body = {
        "message": "Go Serverless v1.0! Your function executed successfully!",
        "input": event
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response