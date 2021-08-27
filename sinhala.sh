#!/bin/bash

#--------------------------------------------------------------------
# මෙම sinhala.sh script එක මගින් ඔබට අවශ්‍ය ලෙස sinhala fonts වෙනස් කිරීම සිදු කරයි,
# මෙය භාවිත කිරීම සදහා මුලින්ම system-sinhala-font-changer.sh script එක run කල යුතුය, 
# එය මගින් ඔයට අවශ්‍ය sinhala fonts install කිරීම සිදු කරයි, sinhala fonts වෙනස් කිරීම 
# terminal එකෙහි "sinhala" ලෙස type කල පසු ලැබෙන උපදෙස් මත සිදුකල හැකිය
#--------------------------------------------------------------------

#-----------colored tput outputs-------------------------------------
red=$(tput setaf 9);
yellow=$(tput setaf 11);
lightBlue=$(tput setaf 14);
end=$(tput sgr0);
#--------------------------------------------------------------------

help_message=\
"
Usage
    sinhala 1
    sinhala 2

You can use a number between 1 to 10. 4 regular fonts are available
for selections from 2 to 4. Other fonts are available for selections
from 5 to 10. Setting 1 fot the 1st argument will remove the font 
config configuration file.

Visit https://si.wikipedia.org/wiki/sinhala website to check if font 
configuration is working.
"

#-----------tamporary change dir-------------------------------------
pushd $(dirname $0) &>/dev/null;
#--------------------------------------------------------------------

#-----------process font informations and userInputs-----------------
installedSinhalaFontsList=$(fc-list | grep -i "sinhala\|abhaya" | grep ".local" | awk '{sub(/.*fonts\//,"");sub(/:style.*/,""); sub(/:.*,/,": ");}1' | sort -r);
userRequestedFont=$(awk 'NR=='$1'-9{sub(/.*: /,"");print}' <<< $installedSinhalaFontsList);
installedSinhalaFontsCount=$(($(wc -l <<< $installedSinhalaFontsList) + $(ls ~/.config/system-sinhala-font-changer/fonts-backup/ | wc -l) - 1)); #reduce a font, because fonts counting starting at 10, not in 11
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
  echo "${red}(1/$installedSinhalaFontsCount)${yellow}Removed the fontconfig configuration file.${end}";
 elif [[ $1 == 2 ]];then
  cp ~/.config/system-sinhala-font-changer/50-custom-si.conf ~/.config/fontconfig/conf.d/50-custom-si.conf
  echo "${red}(2/$installedSinhalaFontsCount)${yellow}Created font aliase for sinhala to Noto Sans Sinhala Font.${end}";
 elif [[ $1 == 3 ]];then
  awk '{sub("Noto Sans Sinhala","Noto Serif Sinhala",$0)}1' ~/.config/system-sinhala-font-changer/50-custom-si.conf > ~/.config/fontconfig/conf.d/50-custom-si.conf;
  echo "${red}(3/$installedSinhalaFontsCount)${yellow}Created font aliase for sinhala to Noto Serif Sinhala Font.${end}";
 else
  if $isUserInputIsValid;then
   awk '{sub("Noto Sans Sinhala","'"$userRequestedFont"'")}1' ~/.config/system-sinhala-font-changer/50-custom-si.conf > ~/.config/fontconfig/conf.d/50-custom-si.conf;
   userRequestedFontFullName=$(awk 'NR=='$1'-9{sub(/.ttf.*/,"");sub("-"," ");print}' <<< $installedSinhalaFontsList);
   echo -e "${red}($1/$installedSinhalaFontsCount)${yellow}Created font aliase for sinhala to ${userRequestedFontFullName}${end}";
  fi
 fi

fi

#change to bold sinhala font:
if [[ $1 == 4 ]];then
 mv ~/.local/share/fonts/NotoSansSinhala* ~/.config/system-sinhala-font-changer/fonts-backup/;
 mv ~/.config/system-sinhala-font-changer/fonts-backup/NotoSansSinhala-Bold.ttf ~/.local/share/fonts/;
 cp ~/.config/system-sinhala-font-changer/50-custom-si.conf ~/.config/fontconfig/conf.d/50-custom-si.conf;
 echo "${red}(4/$installedSinhalaFontsCount)${yellow}Created font aliase for sinhala to Noto Sans Sinhala font by removing non-bold fonts.${end}";
fi
#--------------------------------------------------------------------

#-----------display help and usage message---------------------------
if [[ (! "1 2 3 4" =~ "$1" && "$isUserInputIsValid" == "false") || "$1" == "" ]];then
 printf "${help_message}"
fi
#--------------------------------------------------------------------
