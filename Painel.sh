#!/bin/bash
clear
echo "America/Sao_Paulo" > /etc/timezone
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
rm *.sh
wget sshplusmanager.esy.es/revenda/confpainel/criarusuario.sh > /dev/null 2>&1
wget sshplusmanager.esy.es/revenda/confpainel/remover.sh > /dev/null 2>&1
wget sshplusmanager.esy.es/revenda/confpainel/AlterarSenha.sh > /dev/null 2>&1
wget sshplusmanager.esy.es/revenda/confpainel/AlterarData.sh > /dev/null 2>&1
wget sshplusmanager.esy.es/revenda/confpainel/KillUser.sh > /dev/null 2>&1
wget sshplusmanager.esy.es/revenda/confpainel/sshmonitor.sh > /dev/null 2>&1
wget sshplusmanager.esy.es/revenda/confpainel/alterarlimite.sh > /dev/null 2>&1
chmod 777 *sh
echo -e "\n\033[1;32mAGUARDE...\033[0m"
apt-get install cron -y > /dev/null 2>&1
if [[ "$(grep -c "online.ssh" /etc/crontab)" = "0" ]]; then
echo '* * * * * root /usr/bin/php /var/www/html/pages/system/cron.php' >> /etc/crontab
echo '* * * * * root /usr/bin/php /var/www/html/pages/system/cron.ssh.php ' >> /etc/crontab
echo '* * * * * root /usr/bin/php /var/www/html/pages/system/cron.sms.php' >> /etc/crontab
echo '* * * * * root /usr/bin/php /var/www/html/pages/system/cron.online.ssh.php' >> /etc/crontab
echo '10 * * * * root /usr/bin/php /var/www/html/pages/system/cron.servidor.php' >> /etc/crontab
fi
/etc/init.d/cron reload > /dev/null 2>&1
/etc/init.d/cron restart > /dev/null 2>&1
service ssh restart
echo -e "\n\033[1;32mCONCLUIDO!\033[0m"
sleep 3
cat /dev/null > ~/.bash_history && history -c && clear
echo -e "\033[1;36mENTRE NO PAINEL E CRIE UMA CONTA SSH PRA VER SE ESTA TUDO OK!\033[0m"
rm inst
