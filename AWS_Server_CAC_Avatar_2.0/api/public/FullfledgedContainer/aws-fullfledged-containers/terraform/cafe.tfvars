/* // Provide values(Keys) specific to user account credentials
aws_access_key = "************"
aws_secret_key = "************"
aws_region     = "us-east-2"
aws_accountid  = "****************"


// Provide specific values related to VPC, its components and security group

availability_zones = ["us-east-2a", "us-east-2b","us-east-2a", "us-east-2b"]


// Provide specific values related to EC2
instance_type  = "t2.micro"


image_id = "ami-002068ed284fb165b"

// Tags for EC2 Backup, Instance scheduling and others
containers_tag = { Backup : "Daily", "Instance_Schedule" : "Tier1", "Name" : "server1", "Purpose" : "Test", "cost_center" : "XYZ" }


web_server_image="181597866704.dkr.ecr.us-east-2.amazonaws.com/cac_repository:apache"
db_server_image="181597866704.dkr.ecr.us-east-2.amazonaws.com/cac_repository:mariadb"
 */
