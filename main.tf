resource "digitalocean_droplet" "vm1" {
    image = "ubuntu-18-04-x64"
    name = "vm1"
    region = "nyc1"
    size = "512mb"
    private_networking = true
    ssh_keys = [
      "${var.ssh_fingerprint}"
    ]