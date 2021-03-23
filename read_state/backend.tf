terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Ent-Cloud"

    workspaces {
      name = "server-read-state"
    }
  }
}