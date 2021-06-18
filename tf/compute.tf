resource "google_compute_instance" "bigdata" {
  name         = "bigdata"
  machine_type = "e2-medium"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-2104"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = <<EOF
      ubuntu: ${file(var.ssh_key_path.public)~}
      ubuntu: ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAq0fw9O2Y8lSXJPt1y2hbB46mX1u3HpnUDLWdF7TdF0a8C7MHkqS6vB9+Xu5k/+Ktb6cWYGvLUdTrmMsmp9yCsbWTLh4PktDpnBIborrzxucfOwljYsKZJQQalDMtjWq9oYYNFIPI/y1G1icu+KleJtOCCLQFXeo/thTfkxO3pnotXFc20dNmvHpXwjkjrdqU6L+es+YKijR7eVqVSL7BOucA6BM8zb0tCEo3dofUVPQfT5EzPkMEbhsotmlvhHL5NKbrNH/UuMQgK9Te2TqT3cVHbaI7SNWsTirXfUrDc3jBOGLcNUUfkugxkMWzapexFJBBP1FH3x18vuyJoWG6sQ==
    EOF
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u 'ubuntu' -i '${self.network_interface[0].access_config[0].nat_ip},' --private-key ${var.ssh_key_path.private} provision.yml"
  }
}
