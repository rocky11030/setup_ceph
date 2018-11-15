#!/bin/sh
exec /usr/bin/radosgw --cluster=ceph --id rgw.{{ ansible_hostname }} -f --setuser ceph --setgroup ceph
