#base:
  #'*':
   #- write_ip
dev:
   'person-db-server-dr':
     - mysql
     - write_ip
     - cp_file
     #- move_file_q
     - open_port
   'person-app-server-dr':
     #- write_ip
     - move_file_q
     - tomcat
     - deploy
