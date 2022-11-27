data "archive_file" "zip_project" {
  type        = "zip"
  source_dir = var.source_abs_project_path
  output_path = local.zip_out_path
}

resource "digitalocean_droplet" "vm" {
  image  = var.droplet_image
  region = var.droplet_region
  size   = var.droplet_size
  name   = var.droplet_name
  monitoring = true

  ssh_keys = [digitalocean_ssh_key.pub_key.fingerprint]

  connection {
    type        = "ssh"
    user        = "root"
    host        = self.ipv4_address
    private_key = tls_private_key.key.private_key_pem
  }

  # copy zipped project with boot script inside
  provisioner "file" {
    source      = local.zip_out_path
    destination = local.zip_project_name
  }

  # unzip copied project, launch boot script if exists
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install unzip -y",
      "unzip ${local.zip_project_name} -d ${local.project_name} && rm -rf ${local.zip_project_name}",
      "cd ${local.project_name}",
      "test -e ${var.boot_script_name} && sh ${var.boot_script_name}"
    ]
  }
}