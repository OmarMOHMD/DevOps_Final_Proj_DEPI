provider "aws" {
    region = "eu-north-1"
}

terraform {
    required_providers {
        aws = {
        source = "hashicorp/aws"
        version = "5.72.1"
        }
    }
}

resource "aws_instance" "jenkins" {
    ami           = "ami-02db68a01488594c5" # Amazon Linux 2 AMI
    instance_type = "t3.micro"

    tags = {
        Name = "JenkinsServer"
    }

    security_groups = ["jenkins-sg"]
}

resource "aws_security_group" "jenkins_sg" {
    name        = "jenkins-sg"
    description = "Allow SSH and HTTP access"

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