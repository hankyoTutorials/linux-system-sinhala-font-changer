#!/bin/bash

#-----------Welcome log----------------------------------------------
echo "ආ යු බෝ  ව න් !!";
#--------------------------------------------------------------------

#-----------Check Internet Connected Or Not--------------------------
testInternet=$(ping -c 5 google.com);
[[ ! $testInternet =~ "bytes" ]] && echo "ඔ බ ගේ   ප රි ග ණ ක ය  අ න් ත ර් ජා ල ය  හා  ස ම් බ න් ද  වී  නැ ත :-(" && exit;
echo "[පි ය ව ර 1] ඔ බ ගේ   ප රි ග ණ ක ය  අ න් ත ර් ජා ල ය  හා  ස ම් බ න් ද  වී  ඇ ත :-)";
#--------------------------------------------------------------------

#-----------Download Fonts and Extract to .fonts Folder--------------
echo "[පි ය ව ර 2] NotoSansSinhala හා NotoSerifSinhala ය න fonts දැන් download වෙ මි න්  ප ව ති යි...";
mkdir -p ~/.fonts/System-Sinhala-Fonts/;
cd ~/Downloads/;
wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSansSinhala-hinted.zip;
unzip -o NotoSansSinhala-hinted.zip -d ~/.fonts/System-Sinhala-Fonts/

wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifSinhala-hinted.zip;
unzip -o NotoSerifSinhala-hinted.zip -d ~/.fonts/System-Sinhala-Fonts/;
fc-cache -fv;
echo "[පි ය ව ර 3] download ක ර න  ල ද NotoSansSinhala හා  NotoSerifSinhala fonts install ක ර න  ල දි.";
#--------------------------------------------------------------------

#-----------Download Config Script from SLrootKit's Repository-------
mkdir -p ~/.config/fontconfig/conf.d/;
cd ~/.config/fontconfig/conf.d/;
wget https://gist.githubusercontent.com/cipherdragon/c22b2f10b1d05f970b9049028136d0d2/raw/790674d84ac733ea95da181766fb09d6235c7d94/50-custom-si.conf;
cp 50-custom-si.conf ../;
echo -e "[පි ය ව ර 4] sinhala font එ ක  ලෙ ස  NotoSansSinhala font එක  යො දන  ල දි..\n\nfont එ ක  වෙ න ස්  වී  ඇ ත් දැ යි  ප රි ක් ෂා  ක ර  බැ ලී ම ට  මෙ ම  web පි ටු ව ට  පි වි සෙ න් න : https://si.wikipedia.org/wiki/sinhala";
#--------------------------------------------------------------------

#-----------Add Bashrc Alias to Change Fonts Easily------------------
echo "alias 1=\"cp ~/.config/fontconfig/50-custom-si.conf ~/.config/fontconfig/conf.d/50-custom-si.conf && echo 'Now Displaying: Noto Sans Sinhala Font'\"" >> ~/.bashrc;
echo "alias 2=\"awk '{sub(\\\"Noto Sans Sinhala\\\",\\\"Noto Serif Sinhala\\\",\\\$0)}1' ~/.config/fontconfig/50-custom-si.conf > ~/.config/fontconfig/conf.d/50-custom-si.conf && echo 'Now Displaying: Noto Serif Sinhala Font'\"" >> ~/.bashrc;
echo "alias 3=\"rm ~/.config/fontconfig/conf.d/50-custom-si.conf && echo 'Now Displaying: Default System Sinhala Font'\"" >> ~/.bashrc;
source ~/.bashrc;

echo -e "\nඔ බ ට linux terminal එ කෙ හි  මෙ ම  ඉ ල ක් ක ම්  ධා ව න ය  ක ර fonts අ ත ර  හු ව මා රු  වි ය  හැ ක ,\n 1 = NotoSansSinhala\n 2 = NotoSerifSinhala\n 3 = default system font";
#--------------------------------------------------------------------
