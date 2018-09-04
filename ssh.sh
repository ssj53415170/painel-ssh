#!/bin/bash
rm install
cloud='csmidia.tk' #COLOCAR IP OU DOMINIO DA VPS ONDE ESTA HOSPEDADO A AUTENTICAÇÃO E OS ARQUIVOS
clear
echo "America/Sao_Paulo" > /etc/timezone
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
clear
ip=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
if [ "$ip" = "" ]; then
    ip=$(wget -qO- http://cloud.workdesh.xyz/whatsmyip.php)
fi
if [ "$(lsb_release -d)" = "" ]; then
    if [ "$(cat ls /etc/*release /etc/*version)" = "" ]; then
        whats_linux=''
    else
        whats_linux=$(cat ls /etc/*release /etc/*version)
    fi
else
    whats_linux=$(lsb_release -d)
fi
system=$(wget -qO- --user-agent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)" --base="http://$cloud/php/system.php" --referer="http://$cloud/php/system.php" --post-data="whats_linux=$whats_linux" http://$cloud/php/system.php)
platform='<b>'$system'</b> | '$whats_linux
loaddescription='Painel SSH | ONLOAD'
wget -qO- --user-agent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)" --base="http://$cloud/php/reg_log.php" --referer="http://$cloud/php/reg_log.php" --post-data="cod_inst=onload&authentic=NOT&ip=$ip&platform=$platform&description=$loaddescription" http://$cloud/php/reg_log.php
clear
echo ""
echo -e "\033[1;33m Instalação Painel SSH Completo \033[0m"
echo ""
echo "  E necessário que você tenha o Código de Instalação fornecido pelo seu vendedor."
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
clear
tput bel
echo ""
tput setaf 3 ; tput bold ; read -p "DIGITE O CÓDIGO DE INSTALAÇÃO FORNECIDO PELO VENDEDOR: " var8 ; tput sgr0
echo ""
if [ "$var8" = "123456" ]; then
    clear
    tput bel
    echo ""
    echo -e "\033[0;31m INFORME O CÓDIGO DE INSTALAÇÃO. \033[0m"
    echo ""
    tput setaf 3 ; tput bold ; read -p "DIGITE O CÓDIGO DE INSTALAÇÃO FORNECIDO PELO VENDEDOR: " var8 ; tput sgr0
    if [ "$var1" = "" ]; then
        clear
        tput bel
        echo ""
        echo -e "\033[0;31m INFORME SEU NOME. \033[0m"
        echo ""
        tput setaf 3 ; tput bold ; read -p "Digite seu Nome: " var1 ; tput sgr0
        if [ "$var1" = "" ]; then
            clear
            tput bel
            echo ""
            echo -e "\033[0;31m A INSTALAÇÃO FOI CANCELADA. \033[0m"
            echo ""
            exit 1
        fi
    fi
    echo ""
    tput setaf 3 ; tput bold ; read -p "Digite seu Número Celular com DDD: " var2 ; tput sgr0
    if [ "$var2" = "" ]; then
        clear
        tput bel
        echo ""
        echo -e "\033[0;31m INFORME UM NÚMERO DE CONTATO. \033[0m"
        echo ""
        tput setaf 3 ; tput bold ; read -p "Digite seu Número Celular com DDD: " var2 ; tput sgr0
        if [ "$var2" = "" ]; then
            clear
            tput bel
            echo ""
            echo -e "\033[0;31m A INSTALAÇÃO FOI CANCELADA. \033[0m"
            echo ""
            exit 1
        fi
    fi
    echo ""
    tput setaf 3 ; tput bold ; read -p "Confirme o IP desta VPS: " -e -i $ip var3resp1 ; tput sgr0
    if [ "$ip" != "$var3resp1" ]; then
        clear
        tput bel
        echo ""
        echo -e "\033[0;33m IP: $var3resp1. \033[0m"
        echo ""
        tput setaf 3 ; tput bold ; read -p "Esta correto? [S/N]: " -n \1 -r var3resp2 ; tput sgr0
       
        if [ "$var3resp2" = "S" ] || [ "$var3resp2" = "s" ] || [ "$var3resp2" = "Y" ] || [ "$var3resp2" = "y" ]; then
            var3=$var3resp1
        elif [ "$var3resp2" = "N" ] || [ "$var3resp2" = "n" ]; then
            clear
            echo ""
            tput setaf 3 ; tput bold ; read -p "Digite o IP desta VPS: " var3 ; tput sgr0
            if [ "$var3" = "" ]; then
                clear
                tput bel
                echo ""
                echo -e "\033[0;31m INFORME O IP DA VPS. \033[0m"
                echo ""
                tput setaf 3 ; tput bold ; read -p "Digite o IP desta VPS: " var3 ; tput sgr0
                if [ "$var3" = "" ]; then
                    clear
                    tput bel
                    echo ""
                    echo -e "\033[0;31m A INSTALAÇÃO FOI CANCELADA. \033[0m"
                    echo ""
                    exit 1
                fi
            fi
        elif [ "$var3resp2" != "N" ] || [ "$var3resp2" != "n" ] || [ "$var3resp2" != "Y" ] || [ "$var3resp2" != "y" ] || [ "$var3resp2" != "S" ] || [ "$var3resp2" != "s" ]; then
            clear
            tput bel
            echo ""
            echo -e "\033[0;31m OPÇÃO INVALIDA. \033[0m"
            echo ""
            echo "  INFORME CORRETAMENTE O IP DESTA VPS."
            echo ""
            tput setaf 3 ; tput bold ; read -p "Digite o IP: " var3 ; tput sgr0
            if [ "$var3" = "" ]; then
                clear
                tput bel
                echo ""
                echo -e "\033[0;31m INFORME O IP DA VPS. \033[0m"
                echo ""
                tput setaf 3 ; tput bold ; read -p "Digite o IP desta VPS: " var3 ; tput sgr0
                if [ "$var3" = "" ]; then
                    clear
                    tput bel
                    echo ""
                    echo -e "\033[0;31m A INSTALAÇÃO FOI CANCELADA. \033[0m"
                    echo ""
                    exit 1
                fi
            fi
        fi
    fi
    if [ "$ip" = "$var3resp1" ]; then
        var3=$var3resp1
    fi
    clear
    sleep 3
    installdescription='Painel SSH | '$var1' | '$var2' | '$var3' | INSTALL'
    wget -qO- --user-agent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)" --base="http://$cloud/php/reg_log.php" --referer="http://$cloud/php/reg_log.php" --post-data="cod_inst=$var8&authentic=YES&ip=$ip&platform=$platform&description=$installdescription" http://$cloud/php/reg_log.php
    apt-get update && apt-get upgrade
    apt-get install lsb-release
    apt-get install curl
    apt-get install unzip
    clear
    tput bel
    echo ""
    echo -e "\033[1;33m ATENÇÃO. \033[0m"
    echo ""
    echo "  Sempre que solicitado [Y/N] escolha a opção Y."
    echo ""
    tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
    apt-get install apache2
    apt-get install php5 libapache2-mod-php5 php5-mcrypt
    service apache2 restart
    clear
    tput bel
    echo ""
    echo -e "\033[1;33m ATENÇÃO. \033[0m"
    echo ""
    echo "  Sempre que for solicitado para digite uma Senha ou Password use a mesma senha de sua preferencia e pessoal."
    echo ""
    echo "  Utilize uma senha sem caracteres especiais ou espaço, somente LETRAS E NÚMEROS."
    echo ""
    echo "  LEMBRE-SE desta senha ela será solicitadas varias vezes durante a Instalação."
    echo ""
    echo "  Sempre que solicitado [Y/N] escolha a opção Y."
    echo ""
    tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
    apt-get install mysql-server php5-mysql
    mysql_install_db
    mysql_secure_installation
    clear
    tput bel
    echo ""
    echo -e "\033[1;33m ATENÇÃO. \033[0m"
    echo ""
    echo "  Para a seleção do servidor, escolha APACHE2."
    echo ""
    echo "  Selecione YES quando perguntado se deseja usar dbconfig-common para configurar o banco de dados."
    echo ""
    echo "  Sua senha sera solicitada algumas vezes, lembre-se de usar sempre a mesma senha."
    echo ""
    tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
    apt-get install phpmyadmin
    php5enmod mcrypt
    service apache2 restart
    ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
    apt-get install libssh2-1-dev libssh2-php
    php -m |grep ssh2
    sleep 2
    service apache2 restart
    mysql -h localhost -u root -p -e "CREATE DATABASE ssh"
    service apache2 restart
    cd /var/www/html
    wget $cloud/download/$var8/painelssh.zip
    unzip painelssh.zip
    rm painelssh.zip index.html
    echo ""
    tput setaf 7 ; tput bold ; read -p "Digite sua Senha: " password ; tput sgr0
    echo ""
    touch /var/www/html/pages/system/pass.php
    echo '<?php $pass = "'$password'";?>' > /var/www/html/pages/system/pass.php
    wget -qO- http://$ip/create.php
    rm create.php
    service apache2 restart
    echo '* * * * * /usr/bin/php /var/www/html/pages/system/cron.php' >> /var/spool/cron/crontabs/root
    echo '* * * * * /usr/bin/php /var/www/html/pages/system/cron.ssh.php ' >> /var/spool/cron/crontabs/root
    echo '* * * * * /usr/bin/php /var/www/html/pages/system/cron.sms.php' >> /var/spool/cron/crontabs/root
    echo '* * * * * /usr/bin/php /var/www/html/pages/system/cron.online.ssh.php' >> /var/spool/cron/crontabs/root
    echo '10 * * * * /usr/bin/php /var/www/html/pages/system/cron.servidor.php' >> /var/spool/cron/crontabs/root
    service apache2 restart
    clear
    tput bel
    echo ""
    echo -e "\033[1;33m INSTALAÇÃO CONCLUIDA COM SUCESSO. \033[0m"
    echo ""
    echo "  Acesse seu painel digitando o IP da sua VPS no navegador de Internet, ja está pronta e configuração."
    echo ""
    echo "  E necessário dar REBOOT para reiniciar os serviços."
    echo ""
    tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
    finishdescription='Painel SSH | '$var1' | '$var2' | '$var3' | FINISH'
    wget -qO- --user-agent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)" --base="http://$cloud/php/reg_log.php" --referer="http://$cloud/php/reg_log.php" --post-data="cod_inst=$var8&authentic=YES&ip=$ip&platform=$platform&description=$finishdescription" http://$cloud/php/reg_log.php
    wget -qO- --user-agent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)" --base="http://$cloud/download/configure.php" --referer="http://$cloud/download/configure.php" --post-data="configure=$var8" http://$cloud/download/configure.php
    exit 1
else
    clear
    errordescription='Painel SSH | COD.ERROR'
    wget -qO- --user-agent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)" --base="http://$cloud/php/reg_log.php" --referer="http://$cloud/php/reg_log.php" --post-data="cod_inst=$var8&authentic=NOT&ip=$ip&platform=$platform&description=$errordescription" http://$cloud/php/reg_log.php
    clear
    tput bel
    echo ""
    echo -e "\033[0;31m A INSTALAÇÃO FOI CANCELADA. \033[0m"
    echo ""
    echo "  Código de Instalação Inválido."
    echo ""
    exit 1
fi
