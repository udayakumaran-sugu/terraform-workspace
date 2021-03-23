output "random" {
  value = random_id.random.hex
}

output "remote_state_server_public_ip" {
  value = data.terraform_remote_state.write_state.outputs.public_ip
}