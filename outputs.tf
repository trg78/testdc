output "Public ip" {
  value = "${digitalocean_droplet.vm.ipv4_address}"
}

output "Name" {
  value = "${digitalocean_droplet.vm.name}"
}