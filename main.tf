resource "digitalocean_droplet" "vm" {
  image = "ubuntu-18-04-x64"
  name = "vm"
  region = "nyc1"
  size = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = ["${var.ssh_fingerprint}"]



  connection {
     type = "ssh"
     user = "root"
     private_key = "${file("/testgomage/digital_ocean_rsa")}"
     timeout = "5m"

}
}



#Floating IP assignment
resource "digitalocean_floating_ip" "ip" {
  region = "nyc1"
  droplet_id = "${digitalocean_droplet.vm.0.id}"
}



resource "digitalocean_firewall" "vm" {
  name  = "testing-terraform-firewall"


  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

}