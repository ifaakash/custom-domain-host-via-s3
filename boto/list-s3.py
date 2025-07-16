import boto3
import json
import pprint

client= boto3.client('s3')

try:
    response= client.list_buckets(Prefix='poc-', BucketRegion='us-east-2', MaxBuckets=5)
    # pp = pprint.PrettyPrinter(indent=4)
    # print("Script executed!\n Output:")
    # pp.pprint(response['Buckets'])
    print(f"Script executed!\nList of Buckets: \n{response['Buckets'][0]['Name']}")
except Exception as e:
    print(f"Failed to run the script!!\n Error message: ${e}")
