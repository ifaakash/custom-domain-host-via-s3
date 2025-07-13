import boto3

client= boto3.client('s3')

# Filename (str) – The path to the file to upload.
# Bucket (str) – The name of the bucket to upload to.
# Key (str) – The name of the key to upload to.
#  S3.Client.upload_file(Filename, Bucket, Key, ExtraArgs=None, Callback=None, Config=None)

try:
    upload_file= client.upload_file('landing.html', 's3-hosted-website', 'landing.html', ExtraArgs={'ContentType': 'text/html'})
    print("File uploaded successfully!")
except Exception as e:
    print(f"File not uploaded!!\n Error message: ${e}")
