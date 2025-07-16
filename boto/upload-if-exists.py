import boto3

client= boto3.client('s3')
destination_bucket_name= "poc-20250716220204659100000001"
try:
    response= client.list_buckets(Prefix='poc-', BucketRegion='us-east-2', MaxBuckets=5)
    # pp = pprint.PrettyPrinter(indent=4)
    # print("Script executed!\n Output:")
    # pp.pprint(response['Buckets'])
    print(f"Script executed!\nList of Buckets: \n{response['Buckets'][0]['Name']}")
    print("##### DEBUGGING STEP #####")
    if response['Buckets'][0]['Name'] == destination_bucket_name:
        print("Already the destination buckets exists! Skipping to upload the file")
    else:
        print("Destination bucket doesn't exists!! Please create a new one")
except Exception as e:
    print(f"Failed to run the script!!\n Error message: ${e}")
