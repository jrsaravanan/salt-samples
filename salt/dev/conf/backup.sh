#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
 
USER="testuesr"
PASSWORD="testpass"
OUTPUT="/var/opt/db"
 
 
databases=`mysql --user=$USER --password=$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`
 
for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != _* ]] ; then
        echo "Dumping database: $db"
        mysqldump --force --opt --user=$USER --password=$PASSWORD --databases $db > $OUTPUT/$db.sql
    fi
done
