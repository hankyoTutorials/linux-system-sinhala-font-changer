#!/bin/bash

#-----------version-1.0v---------------------------------------------
# මෙම system-sinhala-font-changer.sh script එක මගින් අවශ්‍ය sinhala fonts 
# download කිරීම හා install කිරීම හා අනෙකුත් කාර්යයන් බොහෝමයක් සිදුකරයි
#--------------------------------------------------------------------

# -------------------------- colored tput outputs ------------------------- 
red=$(tput setaf 9);
yellow=$(tput setaf 11);
lightBlue=$(tput setaf 14);
end=$(tput sgr0);

# ------------------------------ welcome log ------------------------------ 
printf \
"
${yellow}Welcome to Font Changer Script!!!${end}

This Script will add a configuration file for font config library in
\"~/.config/fontconfig/conf.d/50-sinhala-custom.conf\", this will render
any sinhala text in a sinhala font you choose in the next steps. Script
will install fonts if they are not already installed. New fonts will be
installed to \"~/.local/share/fonts/ttf/(font family name)/(font).ttf\"

Since all actions are done in user level, no settings will apply system
wide. If you need settings to apply system wide, either do it manually
or run the script for each user.
\n"
#--------------------------------------------------------------------

read -p "Press enter to continue> "

#-----------Download and Extract Fonts-------------------------------

printf \
"
Select the font you want to set as the sinhala font. Type the corresponding 
number of the font you like. Visit the link in the bracket to preview how 
each font will look like. 

Here are your options, 

1 - Noto Sans Sinhala (https://www.google.com/get/noto/#sans-sinh)
2 - Noto Serif Sinhala (https://www.google.com/get/noto/#serif-sinh)

n - exit
"

while true
do
	read -p "select the font (type the number)> " selected_font_code
	[[ $selected_font_code =~ ^n$ ]] && exit
    [[ $selected_font_code =~ ^[12]$ ]] && break
	printf "Only 1 or 2 or n is accepted. n to exit the script.\n\n"
done

selected_font=$(([[ $selected_font_code == 1 ]] && echo "Noto Sans Sinhala") || (echo "Noto Serif Sinhala"))

printf "\nChecking if the selected font is installed...\n\n"

if ! fc-list | grep -i "$selected_font" > /dev/null; then
	printf "%s\n" \
        "Script detected that the selected font is not installed." \
        "Font will be installed now. Select an option for installation." \
        "" \
        "1 - Install the full font package (highly recommended)" \
        "2 - Only install the bold font" \
        "n - Exit" \
        "" \
        "Note:" \
        "Some users prefer to render sinhala text in bold. In that case," \
        "you can choose to install only the bold font (2 option), but it" \
        "is highly recommended to install full font pack as it allows the" \
        "application to decide what font weight to use."

	while true
	do
		read -p "(type the number)> " selected_font_install_option
		[[ $selected_font_install_option =~ ^n$ ]] && exit
    	[[ $selected_font_install_option =~ ^[12]$ ]] && break
		printf "Only 1,2,n or 0 is accepted. n to exit the script.\n\n"
	done

	copy_dest=~/".local/share/fonts/ttf/${selected_font}"
	
	mkdir -p "$copy_dest"
	cp ./fonts/"${selected_font}"/*-Bold.ttf "$copy_dest" 

	if [[ $selected_font_install_option == 1 ]]; then
		cp -n ./fonts/"${selected_font}"/* "$copy_dest"
	fi

	fc-cache -f
fi

printf '%s\n' "Setting up the configuration file..."

mkdir -p ~/.config/fontconfig/conf.d
sed "s/FONT_PLACE_HOLDER/${selected_font}/" 50-si-custom.conf > ~/.config/fontconfig/conf.d/50-si-custom.conf

printf '%s\n' "Configuration is now completed! Exiting."
