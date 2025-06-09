# Web applicaiton hosting on S3
- Create s3 bucket
- ACLs enabled
- Object Ownership -> Bucket owner preferred
- Block Public Access settings for this bucket (Uncheck)
- Bucket Versioning -> enable
Then you need to upload the files to S3 bucket
inside the object page properties -> Static website hosting
- Static website hosting (Enable)
Then selects the files inside bucket goes to Actions and Make public using ACL
Now you can access the webapplicaiotn from the url of Bucket website endpoint
