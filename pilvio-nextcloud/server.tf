resource "pilvio_vm" "web_server" {
  name       = "nextcloud"
  os_name    = "ubuntu"
  os_version = "22.04"
  memory     = 2048
  vcpu       = 1
  username   = var.vm.username
  password   = var.vm.password
  disks      = 60
  cloud_init = jsonencode({
    "packages" = [
      "docker.io"
    ],
    "runcmd" = [
      "sudo docker run --init --sig-proxy=false --name nextcloud-aio-mastercontainer --restart always --publish 80:80 --publish 8080:8080 --publish 8443:8443 --volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config --volume /var/run/docker.sock:/var/run/docker.sock:ro nextcloud/all-in-one:latest"
  ]
  })
}

resource "pilvio_floatingip" "web_public_ip" {
  name               = "nextcloud-public-ip"
  billing_account_id = var.pilvio.billing_account_id
}

resource "pilvio_floatingip_assignment" "web_server_ip_assignment" {
  assigned_to = pilvio_vm.web_server.uuid
  address = pilvio_floatingip.web_public_ip.address
}