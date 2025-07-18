# What this repoistory do?

1. Build a simple website for displaying simple  --> `Completed`
2. Create a S3 bucket in AWS using terraform  --> `Completed`
3. Write a boto3 library to upload this file to any s3 bucket and test the script ( involve logic to check all the bucket available)  --> `Completed`
4. Check if the name you want is present in that list of s3 bucket  --> `Completed`
5. If its not there, then create the bucket, else re-use and upload the file
6. Host the static page on s3
7. Upload the `index.html` and `error.html` as S3 objects
7. Create a github action to deploy the index.html to s3 bucket using AWS CLI installed via github action


## Observation Points:
1. The files are not loaded as objects due to which we cannot access the website( being hosted using S3 )
