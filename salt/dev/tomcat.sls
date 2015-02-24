
tomcat7:
 
 pkg:
  - installed
 service:
  - running
  - require:
    - pkg: tomcat7

#/var/lib/tomcat7/webapps/person.war:                        # ID declaration
 # file:                                     # state declaration
  # - managed                               # function
   #- source: salt://webserver/person.war # function arg
   #- require:                              # requisite declaration
    # - pkg: tomcat7

#/var/www/html/index.html:                        # ID declaration
 # file:                                     # state declaration
  #  - managed                               # function
   # - source: salt://webserver/index.html   # function arg
    #- require:                              # requisite declaration
    #  - pkg: apache2





