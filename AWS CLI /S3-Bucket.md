# S3 Bucket

Amazon Simple Storage Service (S3) offers object storage service on cloud. Each object has a unique key that can be used to retrieve it later.

Can be created  
- By UI
- By CLI

## Create AWS S3 Bucket though CLI

First Configure AWS
Create security_credentials →Access key  aws configure  put the credentials 
```
aws configure
```
Now we can access the aws by comand line.

```
aws s3api create-bucket --bucket second-admin-aws-s3-bucket --region eu-central-1 --create-bucket-configuration LocationConstraint=eu-central-1  
```
or
```
aws s3 mb s3://your-bucket-name
```

To print s3 buckets on your AWS
```
aws s3 ls
```

To see what is inside of a bucket:  
```
aws s3 ls s3://first-admin-aws-s3-bucket --recursive --human-readable --summarize
```

To Delete empty bucket:   
```
aws s3api delete-bucket --bucket second-admin-aws-s3-bucket12 --region eu-central-1 
```

To Delete non-empty bucket: 
First Delete objects inside it : 
```
aws s3 rm s3://first-admin-aws-s3-bucket --recursive
```
Then delete  bucket : 
```
aws s3api delete-bucket --bucket  first-admin-aws-s3-bucket 
```
or
```
aws s3 rb s3://first-admin-aws-s3-bucket --force   
```
or
```
aws s3 rb s3://your-bucket-name
```
