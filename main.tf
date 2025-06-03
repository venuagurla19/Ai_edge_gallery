provider "aws" {
    region = "us-east-1a"
}

resource "aws_key_pair" "jenkins_key_pair" {
    key_name = "jenkins-key"
    public_key = file("~?.ssh/id_rsa.pub")
}

resource "aws_security_group" "jenkins_sg" {
    name = "jenkins-sg"
    description = "Allow SSH and Jenkins"


ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "jenkins_instance" {
    ami             = "ami-0f9de6e2d2f067fca"
    instance_type   = "t2.medium"
    key_name = aws_key_pair.jenkins_key_pair
    vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

    user_data = file("jenkins-install.sh")

    tags = {
        Name = "jenkins-server"
    }
}

resource "aws_s3_bucket" "jenkins_artifacts" {
    bucket = "jenkins-artifacts-${random_id.bucket_suffix.hex}"
    force_destroy = true
}

resource "random_id" "bucket_suffix" {
    byte_length = 4
}
