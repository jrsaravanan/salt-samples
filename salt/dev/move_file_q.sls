move_file_q:
  file.managed:
    - makedirs: true
    - name: /var/opt/properties/person/person.properties
    - source: 
       - salt://properties/person/person.properties
    - mode : 777
