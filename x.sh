#!/bin/sh

#ATUALIZA O SISTEMA
apt-get update

#INSTALA O ZIP
apt-get install zip

#INSTALA PACOTES NESSESSARIOS
apt-get install apache2 php5 php5-cli php5-mysql libapache2-mod-php5 php5-curl curl mysql-server-5.5  mysql-client-5.5 phpmyadmin

#CONFIGURA O APACHE2
cd /etc/apache2
rm -r ports.conf
wget http://144.217.89.87:81/ports.conf
/etc/init.d/apache2 restart

#INSTALA O proxy
apt-get install squid3
cd /etc
rm -r squid3
wget http://144.217.89.87:81/squid3.zip
unzip squid3.zip
/etc/init.d/squid3 restart

#INSTALAR PAINEL
cd /var/www
wget http://144.217.89.87:81/3g.tgz
tar -zxvf 3g.tgz
rm -r 3g.tgz
chmod -R 777 3g

#copia banco de dados
cd /var 
wget http://144.217.89.87:81/3g.sql

#CRIAR BANCO DE DADOS
mysql -u root -pjeronimo -e "CREATE database 3g" ;
mysql -u root -pjeronimo 3g < "/var/3g.sql"

#CONFIG SSH
echo "Port 443" >>/etc/ssh/sshd_config
#CRONTAB
sudo echo "ize:ize:1010:1010::/home/ize:/bin/false" | newusers
