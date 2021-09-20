#!/bin/bash
# Web-Player 
# Lukas
########################################################################
rm -rf install.sh
fun_bar () {
comando[0]="$1"
comando[1]="$2"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
 tput civis
echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
while true; do
   for((i=0; i<18; i++)); do
   echo -ne "\033[1;31m#"
   sleep 0.1s
   done
   [[ -e $HOME/fim ]] && rm $HOME/fim && break
   echo -e "\033[1;33m]"
   sleep 1s
   tput cuu1
   tput dl1
   echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}
echo -e "\E[41;1;38m AUTO SCRIPT DE INSTALAÇÃO WEB-PLAY          \E[0m" # aki vc pode trocar os texto e cores
echo ""
  echo -ne "  \033[1;32m DESEJA CONTINUAR \033[1;31m? \033[1;33m[S/N]:\033[1;37m "; read res
echo -e "\E[41;1;38m                                             \E[0m"
  if [[ "$res" = n || "$res" = N ]];then
  echo ""
  echo -e "\033[1;31m OK \033[1;32mABORTANDO INSTALACAO!\033[0m"
  rm -rf install.sh > /dev/null 2>&1
  sleep 2
  clear; exit 1
fi
echo -e "\E[41;1;38m                                             \E[0m"
########################################################################
echo -e "           \033[1;33m \033[1;32mATUALIZANDO LINUX \033[1;33m\033[0m"
fun_update () {
    apt-get update -y > /dev/null 2>&1
	#apt-get upgrade -y > /dev/null 2>&1
}
fun_bar 'fun_update'
echo ""
########################################################################
echo -e "           \033[1;33m \033[1;32mINSTALANDO O APACHE2 \033[1;33m\033[0m"
fun_apache2 () {
    apt-get install apache2 -y > /dev/null 2>&1
	service apache2 restart > /dev/null 2>&1
}
fun_bar 'fun_apache2'
echo ""
#########################################################################
echo -e "           \033[1;33m \033[1;32mINSTALANDO PHP 7.2 \033[1;33m\033[0m"
fun_php7.2 () {
    apt-get install php7.2 -y > /dev/null 2>&1
}
fun_bar 'fun_php7.2'
echo ""
########################################################################
echo -e "           \033[1;33m \033[1;32mINSTALANDO WGET CURL GIT \033[1;33\033[0m"
fun_cwg () {
    apt-get install curl -y > /dev/null 2>&1
	apt-get install wget -y > /dev/null 2>&1
	apt-get install git -y > /dev/null 2>&1
	apt-get install unzip -y > /dev/null 2>&1
}
fun_bar 'fun_cwg'
echo ""
########################################################################
echo -e "           \033[1;33m \033[1;32mBAIZANDO CONFIG \033[1;33m\033[0m"
fun_ext () {
    curl -s http://www.script-4gnet.giize.com/OpenXC-Player/master/php7.2-ext.sh | sudo bash > /dev/null 2>&1
	wget -q http://www.script-4gnet.giize.com/OpenXC-Player/master/000-default.conf -O /etc/apache2/sites-available/000-default.conf > /dev/null 2>&1
	service apache2 restart
}
fun_bar 'fun_ext'
echo ""
clear
########################################################################
echo -e "           \033[1;33m \033[1;32m FINALIZANDO INSTALACAO, PODE DEMORAR \033[1;33m\033[0m"
cd /var/www/html
wget http://www.script-4gnet.giize.com/OpenXC-Player/master/Web-player.zip > /dev/null 2>&1
sleep 1
unzip Web-player.zip > /dev/null 2>&1
rm -rf Web-player.zip index.html > /dev/null 2>&1
service apache2 restart
sleep 1
cd
##################################
clear
echo ""
echo -ne "\n\033[1;32m  DEFINA UM DOMINIO 'sem o www'\033[1;33m DNS\033[1;37m: "; read dominio
if [[ -e "/var/www/html/libs/config.php" ]]; then
sed -i "s;domain.com;$dominio;g" /var/www/html/libs/config.php > /dev/null 2>&1
fi
sleep 1
cd
##################################
clear
echo ""
rm -rf !$/.git > /dev/null 2>&1
rm -rf /var/www/html/.gitattributes > /dev/null 2>&1
rm -rf /var/www/html/install.sh > /dev/null 2>&1
rm -rf /var/www/html/README.md > /dev/null 2>&1
rm -rf /var/www/html/php7.2-ext.sh > /dev/null 2>&1
##################################
clear
IP=$(wget -qO- ipv4.icanhazip.com)
clear
echo -e "\E[44;1;37m PAINEL WEB-PLAY \E[0m"
echo ""
echo -e "                 \033[1;31mTelegram: @adeilsonfi\033[1;36m"
echo -e "                 \033[1;31mWhatsapp: 69992261779\033[1;36m"
echo -e "     \033[1;37mOficial www.vpainelweb.tk\033[1;36m"
echo ""
echo ""
echo -e "\033[1;36m SEU PAINEL WEB-PLAY:\033[1;37m http://$IP/\033[0m"
##################################
cd
echo 'gerar1' >> /root/.bashrc
sed -i "s;upload_max_filesize = 2M;upload_max_filesize = 20M;g" /etc/php5/apache2/php.ini > /dev/null 2>&1
service apache2 restart
#echo -e "\033[1;31m A VPS SERA REINICIADO EM SEGUNDOS...\033[0m"
#sleep 5
#echo ""
#echo -e "\033[1;31mREINICIANDO...\033[0m"
#reboot
cat /dev/null > ~/.bash_history && history -c
rm /root/painelv28-editavel > /dev/null 2>&1
rm /root/PAINEL-V.28NV.zip > /dev/null 2>&1

