# Main definition
locals {
  inventory = yamldecode(file("${var.inventory_path}"))
}

# Construct the Ansible group for servers.
resource "ansible_group" "servers" {
  name     = "servers"
  children = [for host in keys(local.inventory.servers.hosts) : host]
}

resource "ansible_playbook" "servers" {
  for_each   = local.inventory.servers.hosts
  name       = each.key
  playbook   = "${path.module}/playbooks/vault-servers.yml"
  replayable = true
  groups     = [ansible_group.servers.name]
  var_files  = ["${path.module}/vars/vault-servers.yml"]
}
