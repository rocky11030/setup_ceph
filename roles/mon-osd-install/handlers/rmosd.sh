#! /bin/bash
rm -rf /tmp/osd.num
ls /var/lib/ceph/osd | awk -F-  '{print $2}' >> /tmp/osd.num
m=`ls -l /var/lib/ceph/osd/ | grep -v total | awk -Fceph- '{print $2}' | wc -l`
function removeosd ()
{
n=`sed -n $1p /tmp/osd.num`
ceph osd out $n
stop ceph-osd id=$n
ceph osd crush remove osd.$n
ceph auth del osd.$n
ceph osd rm $n
umount /var/lib/ceph/osd/ceph-$n
}
for (( i=1; i<=$m; i++ ));do
if [ $i -eq $m ];then
removeosd $i;
ceph osd crush remove `hostname`
else
removeosd $i;
#sleep 300
fi
done
