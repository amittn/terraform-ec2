# terraform-ec2
Terraform code for bringing up an ec2 instance

# Usage
Run the following commands to create the infrastructure.

 `terraform init`

 `TF_VAR_ec2_key_pair="some-aws-key-pair" TF_VAR_my_ip_address="00.00.000.000/32" terraform plan`
 
 `TF_VAR_ec2_key_pair="some-aws-key-pair" TF_VAR_my_ip_address="00.00.000.000/32" terraform apply`
 
 `TF_VAR_ec2_key_pair="some-aws-key-pair" TF_VAR_my_ip_address="00.00.000.000/32" terraform destroy`
 