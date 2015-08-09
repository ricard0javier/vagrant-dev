mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS lse89ers;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE USER 'lse89ers'@'%' IDENTIFIED BY '$@';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON lse89ers.* TO 'lse89ers'@'%';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD lse89ers < mysqldump.sql