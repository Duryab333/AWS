# 🌐 Web Application Hosting on AWS S3

Follow these steps to host a static web application (HTML, CSS, JS) using Amazon S3.


## 🪣 Step 1: Create an S3 Bucket

1. Go to the [S3 Console](https://s3.console.aws.amazon.com/s3/).
2. Click **Create bucket**.
3. Set a unique **bucket name** (e.g., `my-web-app-bucket`).
4. In the **Object Ownership** section:
   - Choose **ACLs enabled**
   - Set **Bucket owner preferred**
5. In the **Block Public Access settings**:
   - **Uncheck** "Block all public access"
   - Confirm when prompted
6. Enable **Bucket Versioning** (optional but recommended).
7. Click **Create bucket**.


## 📤 Step 2: Upload Your Website Files

1. Click on your newly created bucket.
2. Choose **Upload**.
3. Select your website files (e.g., `index.html`, `styles.css`, `images/`, etc.).
4. Click **Upload**.


## ⚙️ Step 3: Enable Static Website Hosting

1. Inside the bucket, go to the **Properties** tab.
2. Scroll to **Static website hosting**.
3. Click **Edit** and:
   - Enable **Static website hosting**
   - Choose **Host a static website**
   - Set **index document** as `index.html`
   - (Optional) Set **error document** as `404.html`
4. Click **Save changes**.



## 🔓 Step 4: Make Files Public

1. Go to the **Objects** tab.
2. Select all the files you want to make public (e.g., `index.html`, images, etc.).
3. Click **Actions** → **Make public using ACL**.
4. Confirm the change.


## 🌍 Step 5: Access Your Web Application

- Go back to the **Properties** tab of your bucket.
- Scroll to **Static website hosting**.
- Copy the **Bucket website endpoint** URL.
- Open it in your browser — your site is now live!



✅ **Done!** You’ve successfully deployed a static web application on AWS S3.
