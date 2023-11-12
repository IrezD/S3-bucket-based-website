# S3-bucket-based-website

Bucket Endpoint link: http://s3prod-static-website001.s3-website.eu-central-1.amazonaws.com

Description of the task: 

This project aims to establish a straightforward S3 bucket-based website managed using Terraform and orchestrated by GitHub Actions. The primary objective is to automate the creation, management, and deployment of a simple website hosted on an Amazon S3 bucket. 

By utilizing Terraform, the infrastructure as code (IaC) tool, the project will define the AWS resources required for the S3 bucket, including its configuration, policies, and permissions. GitHub Actions will be set up to respond to changes pushed to the main branch of the repository, automatically triggering the redeployment process, ensuring seamless updates to the website.

The workflow will involve version-controlled infrastructure changes through Terraform, enabling rapid, consistent updates and modifications. Moreover, any updates pushed to the main branch of the repository will seamlessly trigger a redeployment of the website, ensuring the latest changes are reflected promptly.

The project's primary components include:

- Terraform for defining and managing AWS resources.
- GitHub Actions for automation and CI/CD processes.
- S3 bucket serving as the hosting platform for the website content.

Overall, the project aims to establish a streamlined, automated process for managing and deploying a static website hosted on an S3 bucket using Terraform and GitHub Actions, ensuring efficiency, consistency, and ease of maintenance.


**************** Outlining the steps to be done ****************
- Create main terraform file
- Create Index file
- Setup Workflow with Github Action (2 stage - 'Review' and 'Live Production')
- Deploy two S3 buckets - a Private one to store the .tfstate file and the other with Public Access to handle web content/hosting.
- Commit all files (including Index file) from local machine to Github main branch which is then pulled to the S3 bucket to enables any changes pushed to the main branch to seemlessly update the file in S3 and redeploy the website.
- Versioning enabled via Terraform on both buckets to allow me revert to previous state if necessary.
