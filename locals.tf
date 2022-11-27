locals {
  out_path = "${path.module}/tmp"

  project_name = basename(var.source_abs_project_path)

  zip_out_path = "${local.out_path}/${local.project_name}.zip"
  zip_project_name = basename(local.zip_out_path)

  ssh_key_paths = {
    "tmp" = "${local.out_path}/${digitalocean_ssh_key.pub_key.name}.pem"
    "ssh" = "~/.ssh/${digitalocean_ssh_key.pub_key.name}.pem"
  }
}