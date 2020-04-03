resource "digitalocean_droplet" "vm1" {
    image = "ubuntu-18-04-x64"
    name = "vm1"
    region = "nyc1"
    size = "s-1vcpu-1gb"
    private_networking = true
    backups = true
    ssh_keys = [
        "${var.ssh_fingerprint}"
    ]
}


connection {
      user = "root"
      type = "ssh"
      private_key = "${file(var.pvt_key)}"
      timeout = "2m"
  }

resource "digitalocean_floating_ip_assignment" "foobar" {
  ip_address = digitalocean_floating_ip.vm1.ip_address
  droplet_id = digitalocean_droplet.vm1.id
}