#!/bin/bash

#-----------ReadMe.md------------------------------------------------
#මෙම sinhala.sh script එක මගින් ඔබට අවශ්‍ය ලෙස sinhala fonts වෙනස් කිරීම සිදු කරයි,
#මෙය භාවිත කිරීම සදහා මුලින්ම system-sinhala-font-changer.sh script එක run කල යුතුය, එය මගින් ඔයට අවශ්‍ය sinhala fonts install කිරීම සිදු කරයි,
#sinhala fonts වෙනස් කිරීම terminal එකෙහි "sinhala" ලෙස typeකල පසු ලැබෙන උපදෙස් මත සිදුකල හැකිය
#--------------------------------------------------------------------

#-----------colored tput outputs-------------------------------------
red=$(tput setaf 9);
yellow=$(tput setaf 11);
lightBlue=$(tput setaf 14);
end=$(tput sgr0);
#--------------------------------------------------------------------

#-----------tamporary change dir-------------------------------------
pushd $(dirname $0) &>/dev/null;
#--------------------------------------------------------------------

#-----------process font informations and userInputs-----------------
installedSinhalaFontsList=$(fc-list | grep -i "sinhala\|abhaya" | grep ".local" | awk '{sub(/.*fonts\//,"");sub(/:style.*/,""); sub(/:.*,/,": ");}1' | sort -r);
userRequestedFont=$(awk 'NR=='$1'-9{sub(/.*: /,"");print}' <<< $installedSinhalaFontsList);
installedSinhalaFontsCount=$(($(wc -l <<< $installedSinhalaFontsList) - 1)); #reduce a font, because fonts counting starting at 10, not in 11
isUserInputIsValid=$(awk 'BEGIN{print (1 <= ('$1'-9) && '$installedSinhalaFontsCount' >= ('$1'-9)) ? "true" : "false"}');
#--------------------------------------------------------------------

#-----------change current font to user requested font---------------
if [[ "1 2 3" =~ "$1" || $isUserInputIsValid == "true" ]];then

 #disable bold fonts if activated:
 if [[ "$(ls ~/.config/system-sinhala-font-changer/fonts-backup/)" =~ "Sinhala" ]];then
  mv ~/.config/system-sinhala-font-changer/fonts-backup/* ~/.local/share/fonts/;
 fi

 #change fonts to given font type:
 if [[ $1 == 1 ]];then
  rm -f ~/.config/fontconfig/conf.d/50-custom-si.conf;
  echo "$red(1/$installedSinhalaFontsCount)$yellow Default Old System Sinhala Font$lightBlue එක වෙ ත  මා රු  ක ර න  ල දි.$end";
 elif [[ $1 == 2 ]];then
  cp ~/.config/fontconfig/50-custom-si.conf ~/.config/fontconfig/conf.d/50-custom-si.conf;
  echo "$red(2/$installedSinhalaFontsCount)$yellow Noto Sans Sinhala Font$lightBlue වෙ ත  මා රු  ක ර න  ල දි.$end";
 elif [[ $1 == 3 ]];then
  awk '{sub("Noto Sans Sinhala","Noto Serif Sinhala",$0)}1' ~/.config/fontconfig/50-custom-si.conf > ~/.config/fontconfig/conf.d/50-custom-si.conf;
  echo "$red(3/$installedSinhalaFontsCount)$yellow Noto Serif Sinhala Font$lightBlue වෙ ත  මා රු  ක ර න  ල දි.$end";
 else
  if $isUserInputIsValid;then
   awk '{sub("Noto Sans Sinhala","'"$userRequestedFont"'")}1' ~/.config/fontconfig/50-custom-si.conf > ~/.config/fontconfig/conf.d/50-custom-si.conf;
   userRequestedFontFullName=$(awk 'NR=='$1'-9{sub(/.ttf.*/,"");sub("-"," ");print}' <<< $installedSinhalaFontsList);
   echo -e "$red($1/$installedSinhalaFontsCount)$yellow $userRequestedFontFullName$lightBlue වෙ ත  මා රු  ක ර න  ල දි.$end";
  fi
 fi

fi

#change to bold sinhala font:
if [[ $1 == 4 ]];then
 mv ~/.local/share/fonts/NotoSansSinhala* ~/.config/system-sinhala-font-changer/fonts-backup/;
 mv ~/.config/system-sinhala-font-changer/fonts-backup/NotoSansSinhala-Bold.ttf ~/.local/share/fonts/;
 cp ~/.config/fontconfig/50-custom-si.conf ~/.config/fontconfig/conf.d/50-custom-si.conf;
 echo "$red(4/$installedSinhalaFontsCount)$yellow Sinhala Bold Font$lightBlue වෙ ත  මා රු  ක ර න  ල දි.$end";
fi
#--------------------------------------------------------------------

#-----------display help and usage message---------------------------
if [[ (! "1 2 3 4" =~ "$1" && "$isUserInputIsValid" == "false") || "$1" == "" ]];then
echo -e "${lightBlue}linux වල sinhala fonts වෙ න ස්  කි රී ම ට  ප හ ත linux commands භා වි ත  ක ර න් න :\n$yellow sinhala 1-4   $lightBlue(1 සි ට 4 දක් වා  ති බෙ න් නේ  ප් ර ධා න fonts 4 වේ )\n$yellow sinhala 10-$installedSinhalaFontsCount $lightBlue(10 සි ට $installedSinhalaFontsCount දක් වා  ත ව ත් fonts රැස ක්  ති බේ )\n$red උ දාහ ර ණ :\n  $yellow sinhala 1\n   sinhala 3\n   sinhala 13\n   sinhala 24\n${red}NOTE:$lightBlue fonts වෙ න ස්  වී ම ට  ත ත් ප ර 5ක් -10ක්  වැ නි  සු ලු  වේ ලා ව ක්  ග ත වේ.\nමෙ ම web පි ටු ව  වෙ ත  පි වි ස  font එ ක  වෙ න ස් වී ඇ ත් දැයි  ප රි ක් ෂා ක ල  හැ ක :\n$yellow https://si.wikipedia.org/wiki/sinhala$end";
fi
#--------------------------------------------------------------------
