# terraform--aws-ec2-instances
# Automated AWS EC2 and Nginx Web Server Provisioning using ServiceNow and Terraform

## 1. Project Overview

This project automates the provisioning of AWS infrastructure using Terraform and ServiceNow. Users submit infrastructure requests through ServiceNow, and the requested resources are automatically deployed in AWS using Terraform.

The solution creates a complete environment including VPC, Subnet, Security Group, EC2 Instance, and Nginx Web Server hosting a custom web page. Terraform workspaces are dynamically created based on the ServiceNow request to ensure isolated state management and multi-user support.

---

# 2. Project Objectives

* Automate AWS infrastructure provisioning.
* Eliminate manual cloud resource creation.
* Integrate ServiceNow with Terraform.
* Dynamically create Terraform workspaces for each request.
* Deploy Nginx automatically on EC2.
* Host a custom HTML webpage.
* Provide infrastructure outputs back to users.

---

# 3. Technologies Used

| Technology          | Purpose                      |
| ------------------- | ---------------------------- |
| ServiceNow          | Request Management           |
| Terraform           | Infrastructure as Code (IaC) |
| AWS EC2             | Compute Resource             |
| AWS VPC             | Network Isolation            |
| AWS Subnet          | Network Segmentation         |
| AWS Security Group  | Firewall Rules               |
| Nginx               | Web Server                   |
| HTML/CSS            | Web Page Development         |
| AWS CLI             | AWS Management               |
| Terraform Workspace | State Isolation              |

---

# 4. Architecture

User
│
▼
ServiceNow Catalog Request
│
▼
ServiceNow Workflow
│
▼
Dynamic Terraform Workspace Creation
│
▼
Terraform Apply
│
▼
AWS Resource Provisioning
│
├── VPC
├── Public Subnet
├── Route Table
├── Internet Gateway
├── Security Group
└── EC2 Instance
│
▼
Nginx Installation
│
▼
Custom HTML Deployment
│
▼
Website Accessible via Public IP

---

# 5. Project Workflow

## Step 1: User Raises Request

The user submits a request through ServiceNow Catalog.

The request contains:

* Environment Name
* AWS Region
* Instance Type
* Key Pair Name
* Project Name
* Business Justification

---

## Step 2: ServiceNow Processes Request

ServiceNow validates the request and triggers the automation workflow.

The request data is passed to Terraform as input variables.

---

## Step 3: Dynamic Workspace Creation

Terraform workspace is automatically created using the ServiceNow Request ID.

Example:

Request Number:
RITM0012345

Workspace Name:
project-RITM0012345

Benefits:

* Separate state files
* Multi-user support
* Environment isolation
* Easier management

---

## Step 4: Infrastructure Provisioning

Terraform provisions the following AWS resources:

### VPC

Creates an isolated network environment.

### Public Subnet

Hosts the EC2 instance.

### Internet Gateway

Provides internet connectivity.

### Route Table

Routes internet traffic.

### Security Group

Allows:

* SSH (Port 22)
* HTTP (Port 80)

### EC2 Instance

Launches an Amazon Linux EC2 server.

---

## Step 5: Nginx Installation

Terraform uses User Data to:

* Update packages
* Install Nginx
* Start Nginx service
* Enable Nginx at boot

Example Commands:

yum update -y

yum install -y nginx

systemctl enable nginx

systemctl start nginx

---

## Step 6: Custom Website Deployment

A custom HTML page is automatically deployed to:

/usr/share/nginx/html/index.html

The page displays:

"Welcome, Khushi! 🌸"

The file is also copied to:

/var/www/html/index.html

---

## Step 7: Outputs Generation

Terraform generates useful outputs:

* Instance ID
* Public IP
* Public DNS
* Private IP
* VPC ID
* Subnet ID
* Security Group ID
* Website URL

Example:

http://54.xxx.xxx.xxx

---

# 6. Terraform Project Structure

terraform-project/

├── provider.tf

├── variables.tf

├── main.tf

├── output.tf

├── terraform.tfvars

└── README.md

---

# 7. Terraform Components

## provider.tf

Configures AWS provider and region.

## variables.tf

Stores reusable input variables.

Examples:

* region
* key_name
* instance_type

## main.tf

Creates:

* VPC
* Subnet
* Route Table
* Internet Gateway
* Security Group
* EC2 Instance
* Nginx Setup

## output.tf

Displays deployment outputs.

---

# 8. Security Implementation

Security Group Rules:

Inbound:

* SSH (22)
* HTTP (80)

Outbound:

* All Traffic Allowed

Benefits:

* Secure remote access
* Public website accessibility

---

# 9. Features

* Infrastructure as Code
* Automated AWS Provisioning
* ServiceNow Integration
* Dynamic Workspace Creation
* Nginx Auto Deployment
* Custom Web Hosting
* Output Automation
* Scalable Architecture

---

# 10. Benefits

* Faster provisioning
* Reduced manual effort
* Consistent deployments
* Improved governance
* Better state management
* Reusable infrastructure code
* Reduced configuration errors

---

# 11. Challenges Faced

* Invalid AMI ID issue
* Key Pair mismatch
* Security Group configuration
* Nginx root directory identification
* EC2 public accessibility troubleshooting
* ServiceNow input validation

---

# 12. Project Outcome

The project successfully automated the complete lifecycle of AWS infrastructure provisioning.

Upon receiving a ServiceNow request:

* A Terraform workspace is dynamically created.
* AWS infrastructure is provisioned.
* Nginx is installed automatically.
* A custom webpage is deployed.
* Outputs are generated and made available to users.

The solution demonstrates an end-to-end Infrastructure Automation workflow using ServiceNow, Terraform, and AWS.

---

# 13. Future Enhancements

* HTTPS with SSL/TLS
* Route 53 Domain Integration
* Auto Scaling Group
* Application Load Balancer
* Terraform Remote State in S3
* CI/CD Integration
* Monitoring with CloudWatch
* Automated Resource Decommissioning
* Cost Optimization Reports
* Multi-Environment Support (Dev, Test, Prod)

---

# 14. Conclusion

This project demonstrates how ServiceNow and Terraform can be integrated to automate cloud infrastructure provisioning on AWS. By using dynamic Terraform workspaces and Infrastructure as Code principles, organizations can achieve faster deployments, improved governance, reduced manual effort, and highly scalable cloud operations.
