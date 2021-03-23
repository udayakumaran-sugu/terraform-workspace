terraform {
  backend "remote" {
    organization = "Ent-Cloud"

    workspaces {
      name = "terraform_advanced"
    }
  }
}