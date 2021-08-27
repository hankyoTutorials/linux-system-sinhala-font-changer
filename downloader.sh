#!/bin/bash

#-----------version-1.0v---------------------------------------------
#This project is not completed yet!
#--------------------------------------------------------------------

#-----------colored tput outputs-------------------------------------
red=$(tput setaf 9);
yellow=$(tput setaf 11);
lightBlue=$(tput setaf 14);
end=$(tput sgr0);
#--------------------------------------------------------------------

#-----------welcome log----------------------------------------------
echo ${yellow}"Welcome to the sinhala font changer script!!"${end};
#--------------------------------------------------------------------

#-----------add sinhala.sh font changing script to bashrc------------
if [[ ! "$(<~/.bashrc)" =~ "sinhala.sh" ]];then
 echo "[ alias sinhala=\"bash ~/.config/system-sinhala-font-changer/sinhala.sh\" ]";
 echo "Can you allow us to add above line to your .bashrc file to continue installation?:";
 read -p 'Type "no" to exit, type "yes" to continue installation: [yes/no]? ' userPermission
 if [[ "${userPermission,,}" == "yes" ]];then
  echo "alias sinhala=\"bash ~/.config/system-sinhala-font-changer/sinhala.sh\"" >> ~/.bashrc;
  echo "${lightBlue}Added sinhala.sh fonts changing script to .bashrc${red}.${end}";
 else
  echo "Stopped the installation.. Exiting!..";
  rm -rf ~/.config/system-sinhala-font-changer/;
  rm -rf ~/.config/fontconfig/conf.d/50-custom-si.conf;
  exit;
 fi
fi
#--------------------------------------------------------------------

#-----------display the help message---------------------------------
sleep 3; #show help message after 3 second
echo -e "\n${red}[step 4] ${yellow}Setup completed! Now you can change system-wide sinhala font ${lightBlue}:${end}\n";

#display help message:
source ~/.config/system-sinhala-font-changer/sinhala.sh;

#change current font to "noto sans sinhala bold":
bash ~/.config/system-sinhala-font-changer/sinhala.sh 4 &>/dev/null;
#--------------------------------------------------------------------
