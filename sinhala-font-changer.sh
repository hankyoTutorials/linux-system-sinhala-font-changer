#!/bin/bash

# -------------------------- Colored tput outputs ------------------------
red=$(tput setaf 9);
yellow=$(tput setaf 11);
green=$(tput setaf 10);
cyan=$(tput setaf 14);
end=$(tput sgr0);

# ------------------------------ Welcome log -----------------------------
printf \
"
${yellow}Welcome to Sinhala Font Changer Script!!!${end}

This Script will add a configuration file for font config library in
\"~/.config/fontconfig/conf.d/50-si-custom.conf\", this will render
any sinhala text in a sinhala font you choose in the next steps. Script
will install fonts if they are not already installed. New fonts will be
installed to \"~/.local/share/fonts/sinhala-font-changer/(font family name)/(font).ttf\"

Since all actions are done in user level, no settings will apply system
wide. If you need settings to apply system wide, either do it manually
or run the script for each user.
\n"
# -------------------------------------------------------------------------

read -p "${green}Press enter to continue> ${end}"

# --------------- Change system sinhala font -----------------------------

printf \
"
Select the font you want to set as the sinhala font. Type the corresponding 
number of the font you like. Visit the link in the bracket to preview how 
each font will look like. 

Here are your options, 
${cyan}
1 - Noto Sans Sinhala (https://www.google.com/get/noto/#sans-sinh)
2 - Noto Serif Sinhala (https://www.google.com/get/noto/#serif-sinh)
3 - tuxSinhala Bold
n - exit
${end}
"

while true
do
  read -p "${green}select the font (type the number)> ${end}" selected_font_code
  case $selected_font_code in
       1)
          selected_font="Noto Sans Sinhala"
          break
          ;;
       2)
          selected_font="Noto Serif Sinhala"
          break
          ;;
       3)
          selected_font="tuxSinhala Bold" 
          break
          ;;
       n)
          exit
          break
          ;;
       *)
          echo "${red}ERROR!: only 1 or 2 or 3 or n is accepted. n to exit the script.${end}"
          ;;
  esac
done  

echo -e "\n${cyan}Now installing \"${green}$selected_font${cyan}\" font,${end}"

copy_dest=~/".local/share/fonts/sinhala-font-changer/${selected_font}"
mkdir -p "$copy_dest"
cp -n ./fonts/"${selected_font}"/* "$copy_dest"
fc-cache -f

echo "${cyan}Setting up \"${green}$selected_font${cyan}\" as the system-wide sinhala font,${end}"

mkdir -p ~/.config/fontconfig/conf.d
sed "s/FONT_PLACE_HOLDER/${selected_font}/" 50-si-custom.conf > ~/.config/fontconfig/conf.d/50-si-custom.conf

echo -e "${cyan}Configuration is now completed!,"
echo -e "${cyan}Current sinhala font is:\n ${yellow}$(LANG=si fc-match)"
echo -e "${green}Done!..${end}"

sed 's/FONT_PLACE_HOLDER/'"${selected_font}"'/g' test-current-sinhala-font > current-sinhala-font.txt;
xdg-open current-sinhala-font.txt
# ------------------------------------------------------------------------
