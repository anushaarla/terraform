resource "aws_instance" "web" {
  # ...

  # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)
  connection {
    type     = "ssh"
    user     = "ubuntu"
    #password = var.root_password
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "puppet apply",
      "consul join ${aws_instance.web.private_ip}",
      "sudo apt update",
      "sudo apt install default-jre",
      "java --version",
      "wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg",
      "sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list",
      "sudo apt update",
      "sudo apt install jenkins",
      "sudo systemctl start jenkins.service",
      "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
    ]
  }
}
