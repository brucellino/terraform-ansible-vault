terraform {
  required_version = "~> 1.16.0"
  required_providers {
    ansible = {
      source  = "ansible/ansible"
      version = "~> 1.3"
    }
  }
}
