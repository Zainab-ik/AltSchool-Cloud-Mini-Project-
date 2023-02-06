# AltSchool-Cloud-Mini-Project-
This is the AltSchool 3rd Semester Mini Project for the Cloud Engineering Track
This projects entails writing a terraform file to create an ec2 instance and also an ansible script to run it. 

## Below is the questions answered;
### 1). Using Terraform, create 3 EC2 instances and put them behind an Elastic Load Balancer.  
The ec2 instances were created in the ec2 instances.tf file but the provider was specified in the provider.tf file as AWS. This is done to maken it more explanatory. 
Here's how to create a load balancer;
Define the Elastic Load Balancer resource in Terraform code.
Make sure to configure the load balancer to forward incoming traffic to the EC2 instance.
Use Terraform commands to plan and apply the Terraform code.

### 2). Make sure that after applying your plan, Terraform exports the public IP addresses of the 3 instances to a file called host-inventory
The ip address of the 3 instances created are stored in the host-inventory file.

### 3). Get a .com.ng or any other domain name for yourself (be creative, this will be a domain you can keep using) and set it up with AWS Route53 within your terraform plan, then add an A record for subdomain terraform-test that points to your ELB IP address.
this is done on the name.com

### 4). Create an Ansible script that uses the host-inventory file Terraform created to install Apache, set timezone to Africa/Lagos and displays a simple HTML page that displays content to clearly identify on all 3 EC2 instances.

