resource "digitalocean_droplet" "vm1" {
    image = "ubuntu-18-04-x64"
    name = "vm1"
    region = "nyc1"
    size = "s-1vcpu-1gb"
    private_networking = true
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


resource "digitalocean_floating_ip" "floating_ip" {
  region     = "nyc1"

}


resource "digitalocean_floating_ip_assignment" "vm1" {
  ip_address = digitalocean_floating_ip.floating_ip.ip_address
  droplet_id = digitalocean_droplet.vm1.id
}

resource "digitalocean_domain" "vm1" {
  name       = "devops-test.gomage.com"
  ip_address = "${digitalocean_droplet.vm1.ipv4_address}"
}

resource "digitalocean_record" "vm1" {
  domain = "${digitalocean_domain.vm1.name}"
  type   = "A"
  name   = "vm1"
  value  = "${digitalocean_droplet.vm1.ipv4_address}"
}

