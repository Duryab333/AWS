# Amazon S3 (Simple Storage Service)

## 📘 Overview

Amazon S3 is an object storage service built to store and retrieve any amount of data from anywhere. It is highly durable (99.999999999% durability), secure, scalable, and designed for a wide range of use cases including backup and restore, big data analytics, serverless application hosting, and more.

S3 stores data as **objects** within **buckets**. Each object consists of data, metadata, and a unique identifier (key). It supports features such as **versioning**, **lifecycle policies**, **access control**, and **event notifications**, making it a core service in many AWS architectures.


## 🧠 Core Concepts

### 🔹 Buckets

- Logical containers for storing objects.
- Globally unique name within S3 namespace.
- Can reside in a specific AWS region.

### 🔹 Objects

- Fundamental entities stored in S3.
- Consist of data, metadata, and a key (unique identifier).
- Max size: up to 5 TB (single PUT limit is 5 GB; use multipart upload for larger files).

### 🔹 Storage Classes

- **S3 Standard** – Frequently accessed data.
- **S3 Intelligent-Tiering** – Automatically moves data between tiers.
- **S3 Standard-IA / One Zone-IA** – Infrequently accessed data.
- **S3 Glacier / Glacier Deep Archive** – Archival storage.

---

## 🔐 Security & Access Control

- **IAM Policies**: Control access using identity-based policies.
- **Bucket Policies**: Set resource-based permissions at the bucket level.
- **ACLs (Access Control Lists)**: Legacy access control (less commonly used).
- **Encryption**:
  - Server-side encryption (SSE-S3, SSE-KMS, SSE-C).
  - Client-side encryption also supported.

---

## 🔄 Data Management Features

- **Versioning**: Keep multiple versions of an object.
- **Lifecycle Rules**: Automatically transition or expire objects.
- **Replication**:
  - **Same-Region Replication (SRR)**
  - **Cross-Region Replication (CRR)**

- **Object Lock**: Write-once-read-many (WORM) protection for compliance.
- **Access Logs**: Track requests to S3 buckets (delivered to another bucket).

---

## ⚙️ Advanced Capabilities

- **Pre-Signed URLs**: Generate temporary access links for private content.
- **Event Notifications**: Trigger AWS Lambda, SQS, or SNS on object events.
- **Requester Pays**: Buckets where requesters pay for download and data transfer.
- **Multi-Part Upload**: Efficiently upload large files in parts for performance.

---

## 🧪 Common Use Cases

- Static website hosting
- Data lake storage for analytics
- Backup and disaster recovery
- Serverless application content storage (Lambda, API Gateway)
- Media hosting (images, videos, documents)
- CDN origin storage (via Amazon CloudFront)

---

## 📌 Best Practices

- Enable versioning to protect against accidental overwrites/deletes.
- Use lifecycle rules to manage storage cost over time.
- Apply least-privilege permissions using IAM roles/policies.
- Encrypt sensitive data at rest and in transit.
- Monitor and audit using AWS CloudTrail and S3 access logs.

