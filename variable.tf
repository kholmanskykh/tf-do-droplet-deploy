variable "do_token" {
  description = "DO token"
  type = string
}

variable "droplet_image" {
  description = "DO Droplet image name"
  default = "ubuntu-20-04-x64"
}

variable "droplet_name" {
  description = "DO Droplet name"
  type = string
  default = "tf-vm"
}

variable "droplet_size" {
  description = "DO Droplet size"
  type = string
  default = "s-1vcpu-2gb"
}

variable "droplet_region" {
  description = "DO Droplet region"
  type = string
  default = "fra1"
}

variable "ssh_key_name" {
  description = "DO Droplet ssh key name"
  type = string
  default = "tf_key"
}

variable "source_abs_project_path" {
  description = "Absolute path for project to be zipped and deployed to Droplet"
  type = string
  default = "/Users/ykholm/Desktop/GSSEdgeX"
}

variable "boot_script_name" {
  description = "Boot script name inside project"
  type = string
  default = "boot.sh"
}