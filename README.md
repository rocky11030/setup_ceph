安装注意事项
========

先编辑group_vars/all里面的变量

填写clustername、moniter的hostname和ip、fsid和radosgw_nss_db_path

其中fsid从ceph节点中uuidgen生成即可


第一步: 安装ceph前配置
--------------

* inventory: hosts,编辑ceph_mon和ceph_osd两个主机变量
* ceph源: 这里默认不提供ceph源安装，在pre_install里面已经安装了ceph源
* 执行命令: ansible-playbook -i hosts ceph_pre_action.yml

第二步: 安装monitor和osd块存储
--------------

* inventory: hosts,编辑hosts主机变量
* 安全起见先执行: ansible-playbook -i hosts add_ceph_mon.yml
* 然后检查ceph的monitor集群是否运行成功(pe -ef|grep ceph-mon)，如果不成功无法创建osd
* 在执行add_ceph_osd.yml之前，如果想保持osd顺序的话，只能把hosts里面的osd的IP一个一个执行
* 再执行: ansible-playbook -i hosts add_ceph_osd.yml
* 当然如果自信没问题可以直接执行: ansible-playbook -i hosts setup_ceph.yml


第三步: 安装rgw对象存储
--------------

* inventory: rgw_hosts，先编辑rgw_hosts的主机变量
* 创建apache.crt需要交互操作，可能会报错，需要手动执行
* 然后执行: ansible-playbook -i rgw_hosts setup_rgw.yml
* 生成证书，按多次回车确认
sudo mkdir /etc/apache2/ssl 
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt
* 注意这段脚本还没验证过，而且rgw和portal连接部分还没编写
