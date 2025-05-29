# EC2 Creation on AWS Using Terraform - Proof of Concept

This PoC automates EC2 instance provisioning on AWS using Terraform for Infrastructure-as-Code (IaC).

---

## Goal

Automate provisioning an EC2 instance on AWS with Terraform for reproducibility and scalability.

---

## Scope

* Provision a single **Amazon Linux 2 EC2 instance**.
* Utilize **Terraform variables** for flexibility.
* Demonstrate **Terraform outputs** for instance ID and public IP.

---

## Tools

* **Terraform**: Infrastructure as Code (IaC)
* **AWS**: Cloud Provider
* **AWS CLI**: Credential configuration

---

## Success Criteria

* EC2 instance created successfully.
* Outputs display **instance ID** and **public IP**.
* Ability to **SSH into the instance**.

---

## Plan

### 1. Project Structure

Create these files:

ec2-terraform/
├── main.tf
├── variables.tf
├── terraform.tfvars
└── outputs.tf


### 2. Terraform Configurations

**`main.tf`**

```terraform
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  tags = {
    Name = "Terraform-EC2"
  }
}

variables.tf

Terraform

variable "aws_region" { description = "AWS region" ; type = string }
variable "ami_id" { description = "AMI ID" ; type = string }
variable "instance_type" { description = "Instance type" ; type = string ; default = "t2.micro" }
variable "key_name" { description = "EC2 key pair name" ; type = string }
terraform.tfvars

Terraform

aws_region     = "us-east-1"
ami_id         = "ami-0953476d60561c955" # Replace with your region's Amazon Linux 2 AMI
instance_type  = "t2.micro"
key_name       = "swapnil-key" # Replace with your EC2 key pair name
Important: Update ami_id and key_name to match your AWS environment.

outputs.tf

Terraform

output "instance_id" { value = aws_instance.web.id }
output "public_ip" { value = aws_instance.web.public_ip }

3. Deploy
Navigate to ec2-terraform/ and run:

Bash

terraform init
terraform validate
terraform plan
terraform apply # Type 'yes' to confirm

4. Connect
After terraform apply, SSH into your instance using the outputted public IP:

Bash

ssh -i your-key.pem ec2-user@<public_ip>
Remember to chmod 400 your-key.pem.

5. Clean Up
To avoid costs, destroy resources:

Bash

terraform destroy # Type 'yes' to confirm

Conclusion
This PoC demonstrates Terraform's ability to automatically provision AWS infrastructure, manage state, and provide a reusable setup.
