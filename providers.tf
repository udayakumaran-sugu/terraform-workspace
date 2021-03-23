provider "aws" {
  #access_key = "AKIAXMT4EY5DAQZMIVX7"
  access_key = var.access_key
  # secret_key = "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"
  secret_key = var.secret_key
  region     = var.region
}
