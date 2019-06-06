FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
  radosgw \
  && rm -rf /var/lib/apt/lists/*

ENV CEPH_MONS "localhost"
ENV CEPH_RADOSGW_ID "radosgw"
ENV CEPH_CLUSTER "ceph"
CMD radosgw -m ${CEPH_MONS} -d --cluster ${CEPH_CLUSTER} --id ${CEPH_RADOSGW_ID} --setuser ceph --setgroup ceph --keyring=/etc/ceph/keyring
