
### Overview
This repo only contains the terraform templates of the ABI assessment for DevOps Internship. You can find the assessment requirements here for all details. 

###### Disclaimer
  I tried to follow the best practices as much as possible, but there was also a tradeoff between completeness and time. I was low on time so that I wanted to finish it as early as possible. For instance, I hardcoded the password and username of the RDS instance inside terraform which is not great at all. Please go ahead and modify this in case you want to integrate it to your work. 

### Assessment Components
The assessment comprises mainly three tasks: 
1. First, to provision the infrastructure on AWS and configure it using Terraform. 
2. Then, building a pipeline for both [the frontend repo](https://github.com/Ahmed-Hodhod/uptime-kuma/) and [the backend repo](https://github.com/Ahmed-Hodhod/laravel/). This pipeline will be triggered automatically once there is a new push to the main branch. 
3. Preparing a migration plan to another cloud provider namely AZURE.

### Tools & Requirements
1. Terraform CLI
2. AWS credentials (access key to enable the pipeline to ssh into the machines)
3. Github Actions to setup the pipelines 
4. SQL client to connect to AWS RDS 
