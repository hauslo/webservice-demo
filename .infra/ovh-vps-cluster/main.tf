
provider "openstack" {}

resource "openstack_compute_keypair_v2" "key" {
  name = var.key.name
  public_key = var.key.key
}

resource "openstack_blockstorage_volume_v2" "volumes" {
  count = length(var.volumes)
  region = var.region

  name = var.volumes[count.index].name

  size = var.volumes[count.index].size
}

resource "openstack_compute_instance_v2" "hosts" {
  count = length(var.hosts)
  region = var.region

  name = var.hosts[count.index].name
  metadata = var.hosts[count.index].metadata

  key_pair = openstack_compute_keypair_v2.key.name

  image_name = "Ubuntu 20.04"
  flavor_name = var.hosts[count.index].flavor_name

  network {
    name = "Ext-Net"
  }

  stop_before_destroy = true
}

locals {
  host_names = openstack_compute_instance_v2.hosts[*].name
  volume_names = openstack_blockstorage_volume_v2.volumes[*].name
}

resource "openstack_compute_volume_attach_v2" "mount" {
  count       = length(var.mount)
  instance_id = openstack_compute_instance_v2.hosts[index(local.host_names, var.mount[count.index].host)].id
  volume_id   = openstack_blockstorage_volume_v2.volumes[index(local.volume_names, var.mount[count.index].volume)].id
}
