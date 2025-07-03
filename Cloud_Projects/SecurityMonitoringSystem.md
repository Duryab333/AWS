# Build a Security  Monitoring System

Create alerts for when your senstitve informaiton is accessed using AWS CloudTrail, CloudWatch and SNS.

## Motivation:
Keep track of who accessing sensitive informaiton/data in AWS where its API keys, database credentials, or other critical  secrets. Its a security risk everytime someone access your informaiton.

Diagram:

![image](https://github.com/user-attachments/assets/b725debc-df5b-4b8c-8103-3f2c2ab4efc3)


In this project we will demonstrate how to set up a monitoring system in AWS using CloudTrail, CloudWatch and SNS!, We're doing this project to leaen how securtiy and monitoring services in AWS work, plus have a working system that actually send us emails too.  

## Secret Mannager :
A servide in AWS use to store sensative information like database credentials, account IDs, API keys... anything that is sensitive information that would cause damage/trouble if it got leaked and shouldn't be lying around in code.
Secret Manager uses an enxryption service called AWS KMS(Key Management Service) to encrypt your secrets, so your secret canÄt be read by anyone without the right access.  

## CloudTrail

CloudTrail is a monitoring service- it recode the events that happeing in AWS account, like creating resources, updating name or setting... and accessing secrets in Secret Mannager. 
To track envents that happen in our account. This will help us to catch logs of who, when and how someone accessed (opens) a secret. This Continous recoding is super valuable for security , troubleshooting and meeting compliance requirements.

CloudTrail events include types like mannagement, data, insights and network activity events. In this project, we set up our trail to track Management events because accesssing a secret falls into that category. It is not a data event( 
which is captures high volum actions performed on recources) because amnnagment events are free to track. 

Accessing secret is cosiered as write activity because of its importance.

