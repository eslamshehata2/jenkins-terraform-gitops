 provider "aws" {
   access_key = "AKIAXD7DMPNEYZ3K7FHQ"
   secret_key = "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"
   region  =  "us-east-2"
}
resource "aws_s3_bucket" "storage_n" {
    bucket = "terraform-bucket-alexx"
    region = "us-east-2"
  }
resource "aws_instance" "default" {
  ami                    = var.ami
  count                  = var.instance_count
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.default.id]
  source_dest_check      = false
  instance_type          = var.instance_type

  tags = {
    Name = "terraform-default"
  }
}
resource "aws_security_group" "default" {
  name = "terraform-default-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
