write_ip_file:
  file.managed:
    - makedirs: true
    - name: /var/opt/properties/person/person.properties
    - source:
       - salt://conf/person.properties 
    - mode : 777
    - template: jinja
    - context:
        database_ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}
