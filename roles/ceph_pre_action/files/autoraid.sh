#!/bin/bash
/opt/MegaRAID/storcli/storcli64 /c0/fall del
for (( i=2;i<8;i++ ))
do
/opt/MegaRAID/storcli/storcli64 /c0 add vd type=raid0 size=all drives=252:$i
done
exit 0
