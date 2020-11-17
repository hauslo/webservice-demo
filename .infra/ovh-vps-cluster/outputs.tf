
output "hosts" {
  value = { for host in openstack_compute_instance_v2.hosts : host.name => host.access_ip_v4 }
}

output "groups" {
  value = { for host in openstack_compute_instance_v2.hosts : host.metadata.group => tomap({ "name" = host.name, "ip" = host.access_ip_v4 })... if host.metadata.group != null }
}
