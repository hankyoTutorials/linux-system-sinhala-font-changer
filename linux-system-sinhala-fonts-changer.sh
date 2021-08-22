#!/bin/bash

#-----------version-1.0v---------------------------------------------
 #මෙම system-sinhala-fonts-changer.sh script එක මගින් අවශ්‍ය sinhala fonts download කිරීම හා install කිරීම හා අනෙකුත් කාර්යයන් බොහෝමයක් සිදුකරයි
 #මෙම script එක install කරන ආකාරය:
  #(terminal එකෙහි පහත commands 2ක run කරන්න):
   #wget https://raw.githubusercontent.com/hankyoTutorials/linux-system-sinhala-font-changer/main/linux-system-sinhala-fonts-changer.sh
   #bash linux-system-sinhala-fonts-changer.sh
 #ඉන්පසු fonts වෙනස් කිරීම සදහා:
   #terminal එකෙහි "sinhala" ලෙස type කලවිට ලැබෙන උපදෙස් පරිදි sinhala fonts වෙනස් කල හැක
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

#-----------Download and Extract Fonts Folder------------------------
mkdir -p ~/.local/share/fonts/;
mkdir ~/.config/sinhala-fonts-changer/;
cd ~/.config/sinhala-fonts-changer/;

echo "[පි ය ව ර 2] sinhala fonts අ න් ත ර් ජා ල යෙ න් download වෙ මි න්  ප ව ති යි:";
echo "Downloading and Installing Noto Sans Sinhala Font:";
wget -q --show-progress https://noto-website-2.storage.googleapis.com/pkgs/NotoSansSinhala-hinted.zip;
unzip -o NotoSansSinhala-hinted.zip -d ~/.local/share/fonts/;
rm ~/.local/share/fonts/*UI*; #remove NotoSansSinhala UI fonts

echo "Downloading and Installing Noto Serif Sinhala Font:";
wget -q --show-progress https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifSinhala-hinted.zip;
unzip -o NotoSerifSinhala-hinted.zip -d ~/.local/share/fonts/;

echo "Downloading and Installing Abhaya-Libre(FMabhaya) Sinhala Font:";
wget -q --show-progress https://github.com/mooniak/abhaya-libre-font/releases/download/v1.060/abhaya-libre-font_v1.060_20170212.zip -O abhaya-libre-font.zip;
unzip -jo abhaya-libre-font.zip '*abhaya-libre-font_v1.060_20170212/ttf/*' -d ~/.local/share/fonts/;

#refresh fonts:
fc-cache -fv &>/dev/null;

echo "[පි ය ව ර 3] Sinhala Fonts වෙ න ස්  කි රී ම ට  සූ දා න ම්  වෙ මි න්  ප ව ති යි:"

echo "Downloading sinhala fonts changing script from github.com:";
wget -q --show-progress https://github.com/hankyoTutorials/linux-system-sinhala-font-changer/raw/main/sinhala.sh;
#--------------------------------------------------------------------


#-----------Download Config Script from SLrootKit's Repository-------
mkdir -p ~/.config/fontconfig/conf.d/;
cd ~/.config/fontconfig/conf.d/;
echo "Downloading 50-custom-si.conf File from Github.com:"; 
wget -q --show-progress https://gist.githubusercontent.com/cipherdragon/c22b2f10b1d05f970b9049028136d0d2/raw/790674d84ac733ea95da181766fb09d6235c7d94/50-custom-si.conf;
cp 50-custom-si.conf ../;
#--------------------------------------------------------------------

#-----------add sinhala.sh font changing script to bashrc------------

#To backup other NotoSans fonts while Bold font is active:
mkdir ~/.config/sinhala-fonts-changer/fonts-backup/;

echo "Add sinhala.sh Fonts Changing Script to Bashrc:";
if [[ ! "$(<~/.bashrc)" =~ "sinhala.sh" ]];then
 echo "alias sinhala=\"bash ~/.config/sinhala-fonts-changer/sinhala.sh\"" >> ~/.bashrc;
 source ~/.bashrc;
fi
#--------------------------------------------------------------------

#-----------display the help message---------------------------------
echo -e "[පි ය ව ර 4] Done!.., ඔ බ ට  දැ න්  sinhala fonts වෙ න ස්  ක ල  හැ ක :\n";
source ~/.config/sinhala-fonts-changer/sinhala.sh;
#--------------------------------------------------------------------
