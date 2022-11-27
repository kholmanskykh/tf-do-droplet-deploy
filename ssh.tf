resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_key" {
  filename = "${local.out_path}/${digitalocean_ssh_key.pub_key.name}.pem"
  content = tls_private_key.key.private_key_pem
  file_permission = "600"
}

resource "digitalocean_ssh_key" "pub_key" {
  name = var.ssh_key_name
  public_key = tls_private_key.key.public_key_openssh
}