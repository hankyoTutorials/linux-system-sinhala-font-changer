#!/bin/bash

#-----------version-0.1.0v-------------------------------------------
 #මෙම system-sinhala-fonts-changer.sh script එක මගින් අවශ්‍ය sinhala fonts download කිරීම හා install කිරීම හා අනෙකුත් කාර්යයන් බොහෝමයක් සිදුකරයි
 #මෙම script එක install කරන ආකාරය:
  #
#--------------------------------------------------------------------

#-----------Welcome log----------------------------------------------
echo "ආ යු බෝ  ව න් !!";
#--------------------------------------------------------------------

#-----------Check Internet Connected Or Not--------------------------
testInternet=$(ping -c 5 google.com);
[[ ! $testInternet =~ "bytes" ]] && echo "ඔ බ ගේ   ප රි ග ණ ක ය  අ න් ත ර් ජා ල ය  හා  ස ම් බ න් ද  වී  නැ ත :-(" && exit;
echo "[පි ය ව ර 1] ඔ බ ගේ   ප රි ග ණ ක ය  අ න් ත ර් ජා ල ය  හා  ස ම් බ න් ද  වී  ඇ ත :-)";
#--------------------------------------------------------------------


#-----------Remove sinhala-fonts-changer files if exists-------------
rm -rf ~/.config/sinhala-fonts-changer/;
rm -rf ~/.config/fontconfig/*;
rm -f ~/.local/share/fonts/Noto*;
#--------------------------------------------------------------------

#-----------Download Fonts and Extract to .fonts Folder--------------
mkdir -p ~/.local/share/fonts/;
mkdir ~/.config/sinhala-fonts-changer/;
cd ~/.config/sinhala-fonts-changer/;

echo "[පි ය ව ර 2] NotoSansSinhala හා NotoSerifSinhala ය න fonts දැන් download වෙ මි න්  ප ව ති යි...";
wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSansSinhala-hinted.zip;
unzip -o NotoSansSinhala-hinted.zip -d ~/.local/share/fonts/;
rm ~/.local/share/fonts/*UI*; #remove UI fonts

wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifSinhala-hinted.zip;
unzip -o NotoSerifSinhala-hinted.zip -d ~/.local/share/fonts/;
fc-cache -fv;

#download sinhala.sh - sinhala font changing script from github:
cp ~/linuxDir/sinhala-fonts-changer/sinhala.sh ./;

echo "[පි ය ව ර 3] download ක ර න  ල ද NotoSansSinhala හා  NotoSerifSinhala fonts install ක ර න  ල දි.";
#--------------------------------------------------------------------

#-----------Download Config Script from SLrootKit's Repository-------
mkdir -p ~/.config/fontconfig/conf.d/;
cd ~/.config/fontconfig/conf.d/;
wget https://gist.githubusercontent.com/cipherdragon/c22b2f10b1d05f970b9049028136d0d2/raw/790674d84ac733ea95da181766fb09d6235c7d94/50-custom-si.conf;
cp 50-custom-si.conf ../;
echo -e "[පි ය ව ර 4] sinhala font එ ක  ලෙ ස  NotoSansSinhala font එක  යො දන  ල දි..\n\nfont එ ක  වෙ න ස්  වී  ඇ ත් දැ යි  ප රි ක් ෂා  ක ර  බැ ලී ම ට  මෙ ම  web පි ටු ව ට  පි වි සෙ න් න : https://si.wikipedia.org/wiki/sinhala";
#--------------------------------------------------------------------

#-----------add sinhala.sh font changing script to bashrc------------
mkdir ~/.config/sinhala-fonts-changer/fonts-backup/;

if [[ ! "$(<~/.bashrc)" =~ "sinhala.sh" ]];then
 echo "alias sinhala=\"bash ~/.config/sinhala-fonts-changer/sinhala.sh\"" >> ~/.bashrc;
 source ~/.bashrc;
fi

echo -e "\nඔ බ ට linux terminal එ කෙ හි  මෙ ම  ඉ ල ක් ක ම්  ධා ව න ය  ක ර fonts අ ත ර  හු ව මා රු  වි ය  හැ ක ,\n 1 = NotoSansSinhala\n 2 = NotoSerifSinhala\n 3 = default system font";
#--------------------------------------------------------------------
