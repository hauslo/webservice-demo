
locals {
  hosts = [ for host in openstack_compute_instance_v2.hosts : tomap({ "name" = host.name, "ip" = host.access_ip_v4, "group" = host.metadata.group }) ]
  groups = distinct([ for host in openstack_compute_instance_v2.hosts : host.metadata.group if host.metadata.group != null ])
}

resource "local_file" "inventory" {
  content = templatefile("${path.module}/inventory.tpl", {
    hosts  = local.hosts,
    groups = local.groups
  })
  filename = var.inventory_file
  file_permission = "0644"
}
