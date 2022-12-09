# Terraform provider for AWS

provider "aws" {
  alias = "usw2"
  region = "us-west-2"

  default_tags {
    tags = {
      Environment = "dan-via-terraform"
      Owner = "dan-via-terraform"
    }
  }
}

provider "aws" {
  alias = "use2"
  region = "us-east-2"

  default_tags {
    tags = {
      Environment = "dan-via-terraform"
      Owner = "dan-via-terraform"
    }
  }
}

provider "aws" {
  alias = "euw3"
  region = "eu-west-3"

  default_tags {
    tags = {
      Environment = "dan-via-terraform"
      Owner = "dan-via-terraform"
    }
  }
}

provider "aws" {
  alias = "syd2"
  region = "ap-southeast-2"

  default_tags {
    tags = {
      Environment = "dan-via-terraform"
      Owner = "dan-via-terraform"
    }
  }
}