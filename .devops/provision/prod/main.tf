
module "ovh-cluster" {
  source        = "../../../.infra/ovh-vps-cluster"

  providers = {
    openstack = openstack.ovh
  }

  region = "GRA7"

  key = {
      name = "admin"
      key = file("../../.local/admin.pub")
  }

  hosts = [
    {
      name = "manager-1"
      flavor_name = "s1-2"
      metadata = {
        group = "manager"
      }
    }
  ]

  volumes = [
    {
      name = "storage-1"
      size = 20
    }
  ]

  mount = [
    {
      host = "manager-1"
      volume = "storage-1"
    }
  ]

  inventory_file = "../../configure/prod/inventory"
}