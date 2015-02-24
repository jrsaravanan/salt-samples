write_ip_file:
  file.managed:
    - makedirs: true
    #- name: /var/opt/properties/person/person.properties
    #- name: salt://webserver/person.tmp.properties
    - source:
       - salt://webserver/person.tmp.properties 
       - salt://webserver/person.properties
    - mode : 777
    - template: jinja
    - context:
        database_ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}
