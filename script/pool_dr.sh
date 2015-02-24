#!/bin/bash
HOSTS="166.78.63.236"
COUNT=4
for myHost in $HOSTS
do
  count=$(ping -c $COUNT $myHost | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')
  if [ $count -eq 0 ]; then
    # 100% failed 
    echo "Host : $myHost is down (ping failed) at $(date)"
    echo "Started  spining Cloud DR Server"
       salt-cloud -p openstack_ub salt-minion-05 && salt '*' state.highstate
  else 
    echo "Host $myHost is OK. ping pass at $(date)"
  fi
done
