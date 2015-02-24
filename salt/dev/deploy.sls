deploy-war:
  cmd.wait:
    - name: |
        set -e
        service tomcat7 stop
        cp /var/tmp/person.war /var/lib/tomcat7/webapps
        service tomcat7 start
    - shell: /bin/bash
    - unless: cmp /var/tmp/person.war /var/lib/tomcat7/webapps/person.war
    - watch:
      - file: get-war

get-war:
  file.managed:
    - name:    /var/tmp/person.war
    - source:  salt://webserver/person.war 
