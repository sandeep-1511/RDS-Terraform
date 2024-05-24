# RDS-Terraform

TASK-2          

 
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

once we run   
            
                         terraform init

By running terraform init, you ensure that your Terraform environment is correctly set up, with all necessary dependencies downloaded and configured, allowing you to proceed with planning and applying your infrastructure changes.


                       Terraform plan 


By running terraform plan, you gain a clear understanding of the changes that will be made to your infrastructure, allowing you to make informed decisions and avoid unintended consequences.

                         Terraform apply 

  By using terraform apply, you ensure that the infrastructure changes defined in your configuration files are applied, creating, modifying, or destroying resources as necessary to match the desired state.

step-2

created mysql rds database . After creating it we need to check .
i.e we need to get inside the database using this command

mysql -u username -h -p <endpoint>
password: xyz

then we will enter into the mysql database


after everything is perfect we need to destroy everything by 

             terraform destroy 

By using terraform destroy, you can efficiently remove all infrastructure components managed by Terraform, ensuring that your environment is cleaned up properly and that the state file remains accurate.

TASK-1

Shell/Bash scripting:
a) A script to get the following:
I. Current Time in UTC
II. Current Time in IST
III. A date time string for 10 days from current date

this is above requirement 
we need give permission to the file chmod 777 to run .
we have done that one once we excuted we get the output.

 
