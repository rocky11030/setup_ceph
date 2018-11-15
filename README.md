安装注意事项
========

此脚本主要是安装ceph的jewel版本(10.2.x),默认使用的是ubuntu14.04

主要是安装ceph的monitor和osd，rgw还不是很成熟

先编辑group_vars/all里面的变量

填写clustername、moniter的hostname和ip、fsid,其中fsid从ceph节点中uuidgen生成即可


第一步: 安装ceph的mon和osd
--------------

* inventory: hosts,编辑ceph_mon和ceph_osd两个主机变量
* 执行命令: ansible-playbook -i hosts mon-osd-install.yml

第二步: 检查ceph的mon和osd是否成功
--------------

* 然后检查ceph的monitor集群是否运行成功(pe -ef|grep ceph-mon)，或者使用cpeh -s，显示集群但是error(没有osd)就没问题，如果不成功无法创建osd
* 如果想保持osd顺序的话，只能把hosts里面的osd的IP一个一个执行,可以使用serial: 1这个参书。
* 查看OSD是否正常执行，使用ceph -s和ceph osd tree来查看


第三步: 安装rgw对象存储
--------------

* inventory: 先编辑hosts里面的ceph_rgw的主机变量
* 然后执行: ansible-playbook -i hosts rgw-install.yml
