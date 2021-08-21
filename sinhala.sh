#!/bin/bash

#-----------ReadMe.md------------------------------------------------
#මෙම sinhala.sh script එක මගින් ඔබට අවශ්‍ය ලෙස sinhala fonts වෙනස් කිරීම සිදු කරයි,
#මෙය භාවිත කිරීම සදහා මුලින්ම system-sinhala-fonts-changer.sh script එක run කල යුතුය, එය මගින් ඔයට අවශ්‍ය sinhala fonts install කිරීම සිදු කරයි,
#sinhala fonts වෙනස් කිරීම terminal එකෙහි "sinhala" ලෙස typeකල පසු ලැබෙන උපදෙස් මත සිදුකල හැකිය
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
 if [[ "$(ls ~/.config/sinhala-fonts-changer/fonts-backup/)" =~ "Sinhala" ]];then
  mv ~/.config/sinhala-fonts-changer/fonts-backup/* ~/.local/share/fonts/;
 fi

 #change fonts to given font type:
 if [[ $1 == 1 ]];then
  rm -f ~/.config/fontconfig/conf.d/50-custom-si.conf;
  echo "(1/$installedSinhalaFontsCount) Default Old System Sinhala Font එක වෙ ත  මා රු  ක ර න  ල දි.";
 elif [[ $1 == 2 ]];then
  cp ~/.config/fontconfig/50-custom-si.conf ~/.config/fontconfig/conf.d/50-custom-si.conf;
  echo "(2/$installedSinhalaFontsCount) Noto Sans Sinhala Font වෙ ත  මා රු  ක ර න  ල දි.";
 elif [[ $1 == 3 ]];then
  awk '{sub("Noto Sans Sinhala","Noto Serif Sinhala",$0)}1' ~/.config/fontconfig/50-custom-si.conf > ~/.config/fontconfig/conf.d/50-custom-si.conf;
  echo "(3/$installedSinhalaFontsCount) Noto Serif Sinhala Font වෙ ත  මා රු  ක ර න  ල දි.";
 else
  if $isUserInputIsValid;then
   awk '{sub("Noto Sans Sinhala","'"$userRequestedFont"'")}1' ~/.config/fontconfig/50-custom-si.conf > ~/.config/fontconfig/conf.d/50-custom-si.conf;
   userRequestedFontFullName=$(awk 'NR=='$1'-9{sub(/.ttf.*/,"");sub("-"," ");print}' <<< $installedSinhalaFontsList);
   echo -e "($1/$installedSinhalaFontsCount) $userRequestedFontFullName වෙ ත  මා රු  ක ර න  ල දි.";
  fi
 fi

fi

#change to bold sinhala font:
if [[ $1 == 4 ]];then
 mv ~/.local/share/fonts/NotoSansSinhala* ~/.config/sinhala-fonts-changer/fonts-backup/;
 mv ~/.config/sinhala-fonts-changer/fonts-backup/NotoSansSinhala-Bold.ttf ~/.local/share/fonts/;
 cp ~/.config/fontconfig/50-custom-si.conf ~/.config/fontconfig/conf.d/50-custom-si.conf;
 echo "(4/$installedSinhalaFontsCount) Bold Sinhala Font වෙ ත  මා රු  ක ර න  ල දි.";
fi
#--------------------------------------------------------------------

#-----------display help message when userInputs are incorrect-------
if [[ (! "1 2 3 4" =~ "$1" && "$isUserInputIsValid" == "false") || "$1" == "" ]];then
echo -e "sinhala fonts වෙ න ස්  කි රී ම ට  ප හ ත commands භා වි ත  ක ර න් න:\n sinhala 1-4    (1 සි ට 4 දක් වා  ති බෙ න් නේ  ප් ර ධා න fonts 4 වේ )\n sinhala 10-$installedSinhalaFontsCount  (10 සි ට $installedSinhalaFontsCount දක් වා  ත ව ත් fonts රැස ක්  ති බේ )\n උ දාහ ර ණ :\n   sinhala 1\n   sinhala 3\n   sinhala 13\n   sinhala 24\nNOTE: fonts වෙ න ස්  වී ම ට  ත ත් ප ර 5ක් -10ක්  වැ නි  සු ලු  වේ ලා ව ක්  ග ත වේ.";
fi
#--------------------------------------------------------------------
