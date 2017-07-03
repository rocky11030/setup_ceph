#!/bin/bash
#
apt-get remove ceph ceph-common ceph-fs-common ceph-fuse ceph-mds libcephfs1 python-ceph -y
rm -rf /var/lib/ceph/mon/*
rm -rf /var/lib/ceph/osd/*
rm -rf /var/lib/ceph/mds/*
rm -rf /var/lib/ceph/radosgw/*
rm -rf /var/lib/ceph/bootstrap-mds/*
rm -rf /var/lib/ceph/bootstrap-mds/*
rm -rf /var/lib/ceph/bootstrap-osd/*
rm -rf /ceph_journal/*
rm -rf /var/run/ceph/*
rm -rf /etc/ceph/*
