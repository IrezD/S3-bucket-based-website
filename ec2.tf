resource "aws_instance" "testInstance" {
  ami = "ami-0669b163befffbdfc"
  instance_type = "t2.micro"
  availability_zone = "eu-central-1c"
  tags = {
    Name = "DemoInstance Deployment"
  }
}