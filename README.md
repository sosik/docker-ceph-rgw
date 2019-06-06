# docker-ceph-rgw
Ceph RadosGW docker image

## Kubernetes

### Create namespace

You can create separate namespace if needed
```
kubectl create ns ceph
```

### Create keyring secret
#### Generate key for user
```
ceph auth get-or-create-key client.radosgw mon "allow rw" osd "allow rwx"
ceph auth get client.radosgw > keyring
```

where username should corespond to id of radosgw instance

#### Create secret
```
kubectl create secret -n ceph generic ceph-radosgw-keyring --from-file=keyring
```

### Create deployment
