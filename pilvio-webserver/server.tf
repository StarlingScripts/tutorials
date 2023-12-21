resource "pilvio_vm" "web_server" {
  name       = "test-web-server"
  os_name    = "ubuntu"
  os_version = "22.04"
  memory     = 512
  vcpu       = 1
  username   = var.vm.username
  password   = var.vm.password
  disks      = 20
  cloud_init = jsonencode({
    "packages" = [
      "nginx"
    ]
  })
}

resource "pilvio_floatingip" "web_public_ip" {
  name               = "test-web-public-ip"
  billing_account_id = var.pilvio.billing_account_id
}

resource "pilvio_floatingip_assignment" "web_server_ip_assignment" {
  assigned_to = pilvio_vm.web_server.uuid
  address = pilvio_floatingip.web_public_ip.address
}
