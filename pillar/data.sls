mysql:
  server:
    # root_password: False - to have root@localhost without password
    root_password: 'admin'
    user: mysql
    # my.cnf sections changes 
    mysqld:
      bind-address: 0.0.0.0
      port: 3306
      log_bin: /var/log/mysql/mysql-bin.log
      binlog_do_db: test
      auto_increment_increment: 5
      max_connect_errors: 4294967295
    mysql:
      # my.cnf param that not require value
      no-auto-rehash: noarg_present

  # Manage databases
  database:
    - test
    - bar
  schema:
    test:
      load: True
      source: salt://mysql/conf/db_backup.schema
    bar:
      load: False

  user:
    testuser:
      password: 'testpass'
      host: '%'
      databases:
        - database: bar
          grants: ['select', 'insert', 'update']
        - database: test
          grants: ['all privileges']
