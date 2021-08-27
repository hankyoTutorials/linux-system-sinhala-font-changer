# linux-system-sinhala-font-changer

Linux මෙහෙයුම් පද්ධති වල සිංහල අකුරු display වීම නිවැරදි ආකාරයෙන් සිදු නොවේ. සිංහල font 
install කළත් එමගින් ගැටළුව නොවිසඳේ. මෙම ගැටළුව විසඳීමට `fontconfig` library එක හරහා 
සිංහල Unicode අකුරු සඳහා සිංහල font එකක් ආදේශනය කළ යුතු බව විශේෂයෙන් මෙහෙයුම් පද්ධතියට 
අවධාරණය කළ යුතුය. මේ සඳහා සැකසිය යුතු `fontconfig` configuration file සම්බන්ධයෙන් Arch 
Wiki හි පහත ලිපි වල විස්තරාත්මකව තතු ඉදිරිපත් කර ඇත.

+ [Font_configuration](https://wiki.archlinux.org/title/Font_configuration)
+ [Font_configuration/Examples](https://wiki.archlinux.org/title/Font_configuration/Examples)

කෙසේ වෙතත් පරිශීලකයන්ගේ පහසුව ගැන සිතා සිංහල අකුරු නිවැරදිව පෙන්වීවට අවශ්‍ය පොදු 
configuration file එකක් සහ අවශ්‍ය font ස්වයංක්‍රීයව download කර install කිරීම සඳහා මෙම 
shell වැඩසටහන නිර්මාණය කර ඇත. මෙහි shell වැඩසටහන් දෙකක් ඇති අතර එමගින් පහත සඳහන් 
දේ සිදු කරයි. 

1. සිංහල font සහ configuration file බාගත කිරීම (linux-system-sinhala-font-changer.sh).
1. Font සහ Config files නිසි ආකාරයෙන් ස්ථාපනය කිරීම (sinhala.sh). 

## භාවිතයට උපදෙස් 

Terminal එකෙහි පහත command එක run කිරීමෙන් shell වැඩසටහන් දෙක download කරගන්න. 
මෙමගින් ඔබ දැනට වැඩ කරමින් සිටින Working directory එකට වැඩසටහන් දෙක download වී 
ස්වයංක්‍රීයව ක්‍රියාත්මක වේ.  
  
```
  wget https://raw.githubusercontent.com/hankyoTutorials/linux-system-sinhala-font-changer/main/downloader.sh -O installer.sh && bash installer.sh && source ~/.bashrc
```
  
ඉන්පසු fonts වෙනස් කිරීම සදහා:
 *  terminal එකෙහි "sinhala" ලෙස type කලවිට ලැබෙන උපදෙස් පරිදි sinhala fonts වෙනස් කල හැක

Contributors:<br/>
Contact Adeepa: slrootkit@gmail.com (https://slrootkit.blogspot.com)<br/>
Contact Hankyo: hankyomail@gmail.com
