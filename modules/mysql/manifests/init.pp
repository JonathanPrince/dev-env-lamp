class mysql {

  # root mysql password
  $mysqlpw = "password"

  # name of database to create
  $db_name = "db"

  # table name to check if db is populated
  $db_table = "my_table"

  # install mysql server
  package { "mysql-server":
    ensure => present,
    require => Exec["apt-get update"],
  }

  #start mysql service
  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }

  # set mysql password
  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p$mysqlpw status",
    command => "mysqladmin -uroot password $mysqlpw",
    require => Service["mysql"],
  }

  # create db if not exists
  exec { "create-database":
    command => "mysql -uroot -p$mysqlpw -e \"create database if not exists $db_name;\"",
    require => Exec["set-mysql-password"],
    logoutput => "on_failure",
  }

  # setup db with data
  exec { "install-dev-database":
    command => "mysql -uroot --password=$mysqlpw $db_name < /vagrant/db.sql",
    unless => "mysqlshow -uroot --password=$mysqlpw $db_name | grep $db_table",
    require => Exec["create-database"],
  }

}
