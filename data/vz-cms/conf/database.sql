CREATE DATABASE IF NOT EXISTS vz_cms;
CREATE USER 'vz_cms'@'%' IDENTIFIED BY 'my-secret-pw';
GRANT ALL ON vz_cms.* TO 'vz_cms'@'%';
FLUSH PRIVILEGES;