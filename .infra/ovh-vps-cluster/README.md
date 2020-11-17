# ovh-vps-cluster

Create a cluster of OVH VPS in the [public cloud](https://www.ovhcloud.com/en-ie/public-cloud/prices/)

## Variables

### `region`

The region to which deploy the cluster. _Changing this will recreate the hosts and volumes._

```hcl2
region = "GRA7"
```

### `key`

The SSH keypair to initialize the hosts with. _Changing this will recreate the hosts._

```hcl2
key = {
  name = "admin"
  key  = "..."   # public key
}
```

### `hosts`

The hosts (compute instances) to create. _Changing an host flavor will recreate it._

```hcl2
hosts = [
  {
    name        = "manager"
    flavor_name = "s1-2"
    metadata    = {
      group = "manager"
    }
  }
]
```

### `volumes`

The volumes (block storages) to create. _Changing a volume size will recreate it._

```hcl2
volumes = [
  {
    name        = "storage-1"
    size        = 100
  }
]
```

### `mount`

Attaches a volume to an host.

```hcl2
mount = [
  {
    host = ""   # host name
    volume = "" # volume name
  }
]
```

## Outputs

### Output `hosts`

### Output `groups`
