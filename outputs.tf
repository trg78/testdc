output "Public ip" {
  value = "${digitalocean_droplet.vm1.ipv4_address}"
}

output "Name" {
  value = "${digitalocean_droplet.vm1.name}"
}

