# read_state/main.tf
data "terraform_remote_state" "write_state" {
  backend = "remote"

  config = {
    hostname = "app.terraform.io"
    organization = "Ent-Cloud"

    workspaces = {
      name = "terraform_advanced"
    }
  }
}