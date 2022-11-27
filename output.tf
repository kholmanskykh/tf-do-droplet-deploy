output droplet_region {
  value = digitalocean_droplet.vm.region
}

output droplet_ip {
  value = digitalocean_droplet.vm.ipv4_address
}