salt:
  module.run:
   - name: cp.get_file
   - path:
      salt://var/cache/salt/master/minions/person-db-server-dr/files/var/opt/properties/person/person.properties
   - dest:
      /var/opt/test/properties/person/person.properties
   - makedirs: True

