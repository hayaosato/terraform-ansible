provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
  version = "~> 2.38.0"
}

provider "local" {
  version = "~> 1.4.0"
}
