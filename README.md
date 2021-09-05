# &nbsp;&nbsp;&nbsp;Linux System Sinhala Font Changer<br/><sub>(Linux වලදි display වෙන sinhala font එක වෙනස් කරමු)</sub>

![sri-lankan-flag](https://user-images.githubusercontent.com/33552426/132079084-17fb09f4-fd62-4f88-a72b-7f204cb9ac7b.gif)

ශ්‍රී ලංකාවෙ linux භාවිත කරන බොහෝ දෙනෙක් linux වලදි display වන සිංහල අකුරු කැතයි හා 
ඒ අකුරු කියවන්න අමාරුයි ලෙස පවසන ලදි, එමනිසා මෙම මෘදුකාංගය නිපදවන ලද්දේ එම ගැටළුවට විසදුමක් වශයෙනි, 
මෙම මෘදුකාංගයෙන් ඔබට කැමති හා ඔබට කියවීමට පහසු sinhala font එකක් display කරගත හැකිය.

මෙම මෘදුකාංගය නිර්මාණය කරඇති ආකාරය:<br/>
<sub> &nbsp;&nbsp;&nbsp;මෙහිදී `fontconfig` library එක හරහා සිංහල Unicode අකුරු සඳහා සිංහල font එකක් ආදේශනය කළ යුතු බව විශේෂයෙන් මෙහෙයුම් පද්ධතියට 
අවධාරණය කරයි, මේ සඳහා සැකසිය යුතු `fontconfig` configuration file සම්බන්ධයෙන් Arch 
Wiki හි පහත ලිපි වල විස්තරාත්මකව තතු ඉදිරිපත් කර ඇත.</sub>

+ [Font_configuration](https://wiki.archlinux.org/title/Font_configuration)
+ [Font_configuration/Examples](https://wiki.archlinux.org/title/Font_configuration/Examples)

### භාවිත කලහැකි Linux මෙහෙයුම් පද්ධති:
 Ubuntu,linux mint,fedora වැනි සෑම linux මෙහෙයුම් පද්ධතියකම මෙම මෘදුකාංගය භාවිත කල හැක.
 
## භාවිතය

### Linux terminal එක භාවිතයෙන් sinhala font වෙනස් කරමු:

පහත command කිහිපය copy කර terminal එකට paste කිරීමෙන් මෙය download කර install කරගතහැකියි:<br/>

```
cd $HOME
wget https://github.com/hankyoTutorials/linux-system-sinhala-font-changer/archive/refs/heads/main.zip
unzip -qo main.zip
mv linux-system-sinhala-font-changer-main system-sinhala-font-changer
```
Install කලපසු මේම වැඩසටහන ක්‍රියාත්මක කිරීමට මෙම command එක භාවිත කරන්න:

```
cd ~/system-sinhala-font-changer/
bash sinhala-font-changer.sh
```
ඉන්පසු ලැබෙන උපදෙස් පරිදි ඔබට කැමති sinhala font එක display කරගතහැකියි.

## ස්තුති කිරීමට අවශ්‍යද? 

+ [Hankyo Tutorials](https://www.youtube.com/channel/UCva_1artxqrL9oUcYAuZpIA) youtube channel එක follow කරන්න.
+ [slrootkit.blogspot.com](https://slrootkit.blogspot.com) තාක්ෂණික blog එක follow කරන්න. 

## උපකාර

Contact Adeepa: slrootkit@gmail.com (https://slrootkit.blogspot.com)<br/>
Contact Hankyo: hankyomail@gmail.com

[Github Issue](https://github.com/hankyoTutorials/linux-system-sinhala-font-changer/issues) එකක් open කිරීමෙන් ද උපකාර ලබා ගත හැකිය. 
