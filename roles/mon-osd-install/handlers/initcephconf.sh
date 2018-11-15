#! /bin/bash
#
cp /etc/ansible/jinyc/ceph-ansible-auto/roles/add-ceph-mon/templates/ceph.conf.bak /etc/ansible/jinyc/ceph-ansible-auto/roles/add-ceph-mon/templates/ceph.conf
cp /etc/ansible/jinyc/ceph-ansible-auto/group_vars/ceph-common.yaml.bak /etc/ansible/jinyc/ceph-ansible-auto/group_vars/ceph-common.yaml
uuidnum=`uuidgen`
sed -i "s@\[fsid\]@${uuidnum}@g" /etc/ansible/jinyc/ceph-ansible-auto/roles/add-ceph-mon/templates/ceph.conf
sed -i "s@\[fsid\]@${uuidnum}@g" /etc/ansible/jinyc/ceph-ansible-auto/group_vars/ceph-common.yaml
