mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS vz_cms;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE USER 'vz_cms'@'%' IDENTIFIED BY '$@';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON vz_cms.* TO 'vz_cms'@'%';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
