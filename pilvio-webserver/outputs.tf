

output web_server_ip {
  value       = "http://${pilvio_floatingip.web_public_ip.address}"
  sensitive   = false
  description = "IP addres of created web server"
}
