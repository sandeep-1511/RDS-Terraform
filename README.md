# RDS-Terraform

Firstly i have taken one EC2 instance .
I installed terraform by following this commands from official terraform documentaion.

          wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
              sudo apt update && sudo apt install terraform


Next i have created below requirements 

   VPC
b) 2 subnets - one private, one public
c) Gateway - NAT + Internet
d) An auto-scaling group:
I. Min:1, max:2
II. Amazon Linux AMI
III. Security Group with only SSH allowed

everything is specified in main.tf, variable.tf and modules 

