# Build a Security  Monitoring System

Create alerts for when your sensitive information is accessed using AWS CloudTrail, CloudWatch and SNS.

## Motivation:
Keep track of who is accessing sensitive information/data in AWS, whether it’s API keys, database credentials, or other critical secrets. It's a security risk every time someone accesses your information.
Diagram:

![image](https://github.com/user-attachments/assets/b725debc-df5b-4b8c-8103-3f2c2ab4efc3)


In this project, we will demonstrate how to set up a monitoring system in AWS using CloudTrail, CloudWatch, and SNS! We're doing this project to learn how security and monitoring services in AWS work, plus have a working system that actually sends us emails too.
## Secret Manager:
A service in AWS used to store sensitive information like database credentials, account IDs, API keys... anything that is sensitive information that would cause damage/trouble if it got leaked and shouldn't be lying around in code. 
Secret Manager uses an encryption service called AWS KMS (Key Management Service) to encrypt your secrets, so your secret can't be read by anyone without the right access.
## CloudTrail

CloudTrail is a monitoring service — it records the events that happen in an AWS account, like creating resources, updating names or settings... and accessing secrets in Secret Manager. To track events that happen in our account, this will help us to catch logs of who, when, and how someone accessed (opened) a secret. This continuous recording is super valuable for security, troubleshooting, and meeting compliance requirements.

CloudTrail events include types like management, data, insights, and network activity events. In this project, we set up our trail to track Management events because accessing a secret falls into that category. It is not a data event ( which captures high-volume actions performed on resources) because management events are free to track.

Accessing a secret is considered a write activity because of its importance.
## Steps

1)  We save the secrets in Secret Manager in AWS
2)  Then created an S3 bucket for that

Then created a trail of CloudTrail and attached that S3 bucket to it.

To access secrets through:

-  Secret Manager Console

-  Command line, you write this (AWS CLI or your CLI tool)

```
aws secretsmanager get-secret-value --secret-id "YOUR-SECRET-ID" --region YOUR-REGION
```

Then you can access your secrets.

3)  Now check the Event History in CloudTrail — we can see information about accessing Secret Keys.

## CloudWatch

It will help us to do deeper analyses with our logs and with creating metrics to track how many times an event happens.

Enable CloudWatch Logs in CloudTrail: Amazon CloudWatch Logs is a service that helps you bring together your logs from different AWS services, including CloudTrail, for visibility, troubleshooting, and analysis. It's especially powerful because once your logs are in CloudWatch, you can create alerts based on specific patterns, visualize trends, or trigger automated responses.


### CloudWatch Vs CloudTrail:

CloudTrail's Event History is useful for quickly reading (management) events that happened in the last 90 days, while CloudWatch Logs are better for combining and analyzing logs from different sources, accessing logs for longer than 90 days, and advanced filtering.

6)   Add a filter in Cloudwatch
7)   Setup CloudWatch Alarm and SNS:
   The CloudWatch alarm goes off i.e. it detects when something's wrong/something exceeds a defined threshold, whereas SNS notifies i.e. it tells you that something has gone wrong.
-   Create a CloudWatch alarm: which is a feature and alert system which is designed to go ON i.e. indicate when certain conditions have been met in our log group
-   In Alarm Configure Actions: set notification service

### TroubleShooting for Error:
When troubleshooting the notification issues, we investigated every single part of our monitoring system — whether CloudTrail is picking up on events that are happening when we access our secret, whether CloudTrail is actually sending logs to CloudWatch, we also verified whether the filter is accidentally rejecting the correct events, and whether triggering the alarm sends an email.

So we initially did not receive an email because CloudWatch was configured with the wrong threshold — instead of calculating the AVERAGE number of times a secret was accessed in a time period, it should've been the SUM.
