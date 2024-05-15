provider "aws" {
}

resource "aws_s3_bucket" "example" {
  bucket = "cd5968-tf-test"
  tags = {
    Name        = "CD-5968"
    TeamName    = "CD"
  }
}
