resource "aws_instance" "testInstance" {
  instance_type = "t2.micro"
  availability_zone = "eu-central-1c"
  tags = {
    Name = "DemoInstance Deployment"
  }
}