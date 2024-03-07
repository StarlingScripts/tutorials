output nextcloud_installation_ip {
  value       = "https://${pilvio_floatingip.web_public_ip.address}:8080"
  sensitive   = false
  description = "Go here to complete Nextcloud installation"
}