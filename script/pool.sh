

#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
#HOSTS="166.78.144.9 166.78.144.172"
HOSTS="104.130.206.11 104.130.203.165"
COUNT=2
frstSrvrdown=0
for myHost in $HOSTS
do
  count=$(ping -c $COUNT $myHost | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')
  if [ $count -eq 0 ]; then
    # 100% failed 
    echo "The value of frstSrvrdown is: " $frstSrvrdown
    if [ $frstSrvrdown -eq '1' ]; then
    	echo "Host : $myHost is down (ping failed) at $(date)"
   	echo "Started  spining Cloud DR Server"
    	##salt-cloud -p openstack_ub person-db-server-dr 
    	#salt-cloud -p openstack_ub person-app-server-dr
        echo "running db deployement ..."
    	salt 'person-db-server-dr' state.highstate
        echo "running app  deployement ... "
    	salt 'person-app-server-dr' state.highstate
    	echo "DR is now up and running"
    else
	echo "My First Server is down:" $myHost $(date)
	frstSrvrdown=1
    fi
  else 
    echo "Host $myHost is OK. ping pass at $(date)"
  fi
done
