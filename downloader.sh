#!/bin/bash

#-----------version-1.0v---------------------------------------------
# මෙම system-sinhala-font-changer.sh script එක මගින් අවශ්‍ය sinhala fonts 
# download කිරීම හා install කිරීම හා අනෙකුත් කාර්යයන් බොහෝමයක් සිදුකරයි
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

#-----------Check Internet Connected Or Not--------------------------
testInternet=$(ping -c 5 google.com);
[[ ! $testInternet =~ "bytes" ]] && echo "${yellow}You are not connected to the internet. Retry after connecting. Exiting...${red}${end}" && exit;
echo "${red}[step 1] ${yellow}Internet connection detected. Moving to next step. ${end}";
#--------------------------------------------------------------------


#-----------Remove system-sinhala-font-changer files if exists-------
rm -rf ~/.config/system-sinhala-font-changer/;
rm -rf ~/.config/fontconfig/*;
rm -f ~/.local/share/fonts/Noto*;
#--------------------------------------------------------------------

#-----------Download and Extract Fonts-------------------------------
mkdir -p ~/.local/share/fonts/;
mkdir ~/.config/system-sinhala-font-changer/;
cd ~/.config/system-sinhala-font-changer/;

echo -e "\n${red}[step 2] ${yellow}Downloading sinhala fonts and configuration scripts...${end}";
echo "${red}-------------------------------------------------"
echo "${lightBlue}Downloading and Installing Noto Sans Sinhala Font${end}";
wget -q --show-progress https://noto-website-2.storage.googleapis.com/pkgs/NotoSansSinhala-hinted.zip;
unzip -qo NotoSansSinhala-hinted.zip -d ~/.local/share/fonts/;
rm ~/.local/share/fonts/*UI*; #remove NotoSansSinhala UI fonts

echo "${lightBlue}Downloading and Installing Noto Serif Sinhala Font${red}:${end}";
wget -q --show-progress https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifSinhala-hinted.zip;
unzip -qo NotoSerifSinhala-hinted.zip -d ~/.local/share/fonts/;

echo "${lightBlue}Downloading and Installing Abhaya-Libre(FMabhaya) Sinhala Font${red}:${end}";
wget -q --show-progress https://github.com/mooniak/abhaya-libre-font/releases/download/v1.060/abhaya-libre-font_v1.060_20170212.zip -O abhaya-libre-font.zip;
unzip -qjo abhaya-libre-font.zip '*abhaya-libre-font_v1.060_20170212/ttf/*' -d ~/.local/share/fonts/;

echo "${lightBlue}Downloading installer script${end}";
wget -q --show-progress https://github.com/hankyoTutorials/linux-system-sinhala-font-changer/raw/main/sinhala.sh;

echo "Downloading fontconfig configuration File from Github.com:"; 
wget -q --show-progress https://gist.githubusercontent.com/cipherdragon/c22b2f10b1d05f970b9049028136d0d2/raw/790674d84ac733ea95da181766fb09d6235c7d94/50-custom-si.conf;

#refresh fonts without verbose messages:
fc-cache -f;

echo -e "\n${red}[step 3] ${yellow}Setting up installlation scripts...${lightBlue}:${end}";

mkdir -p ~/.config/fontconfig/conf.d/;
cd ~/.config/fontconfig/conf.d/;
mv 50-custom-si.conf ~/.config/fontconfig/conf.d/;

#-----------add sinhala.sh font changing script to bashrc------------

#To backup other NotoSans fonts while Bold font is active:
mkdir ~/.config/system-sinhala-font-changer/fonts-backup/;

echo "${lightBlue}Adding sinhala.sh Fonts Changing Script to bashrc${red}.${end}";
if [[ ! "$(<~/.bashrc)" =~ "sinhala.sh" ]];then
 echo "alias sinhala=\"bash ~/.config/system-sinhala-font-changer/sinhala.sh\"" >> ~/.bashrc;
fi
source ~/.bashrc;
#--------------------------------------------------------------------

#-----------display the help message---------------------------------
echo -e "\n${yellow} Setup completed! Now you can run sinhala.sh ${lightBlue}:${end}\n";
#change current font to "noto sans sinhala bold":
bash ~/.config/system-sinhala-font-changer/sinhala.sh 4 &>/dev/null;
#display help message:
source ~/.config/system-sinhala-font-changer/sinhala.sh;
#--------------------------------------------------------------------
