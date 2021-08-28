# linux-system-sinhala-font-changer

Linux මෙහෙයුම් පද්ධති වල සිංහල අකුරු display වීම නිවැරදි ආකාරයෙන් සිදු නොවේ. සිංහල font 
install කළත් එමගින් ගැටළුව නොවිසඳේ. මෙම ගැටළුව විසඳීමට `fontconfig` library එක හරහා 
සිංහල Unicode අකුරු සඳහා සිංහල font එකක් ආදේශනය කළ යුතු බව විශේෂයෙන් මෙහෙයුම් පද්ධතියට 
අවධාරණය කළ යුතුය. මේ සඳහා සැකසිය යුතු `fontconfig` configuration file සම්බන්ධයෙන් Arch 
Wiki හි පහත ලිපි වල විස්තරාත්මකව තතු ඉදිරිපත් කර ඇත.

+ [Font_configuration](https://wiki.archlinux.org/title/Font_configuration)
+ [Font_configuration/Examples](https://wiki.archlinux.org/title/Font_configuration/Examples)

කෙසේ වෙතත් පරිශීලකයන්ගේ පහසුව ගැන සිතා සිංහල අකුරු නිවැරදිව පෙන්වීවට අවශ්‍ය පොදු 
configuration file එකක් සහ අවශ්‍ය font ස්වයංක්‍රීයව install කිරීම සඳහා මෙම shell 
වැඩසටහන නිර්මාණය කර ඇත. 

## භාවිතය

ඔබ git cli භාව්ත කරනවා නම් පහත command එකෙන් මෙය download කරගන්න. 

```
git clone https://github.com/hankyoTutorials/linux-system-sinhala-font-changer.git
```

නැතිනම් [Release page එකෙන් download කරගන්න.](https://github.com/hankyoTutorials/linux-system-sinhala-font-changer/releases/tag/v1.0)
Release page එකෙන් download කරගත් පසු එය unzip කළයුතු වේ. 

Download කිරීමෙන් [හා unzip කිරීමෙන්] පසු terminal එකෙන් `sinhala-font-correction` ෆෝල්ඩරය 
තුලට ගොස් `./sinhala-font-correction.sh` යන විධානයෙන් script එක ක්‍රියාත්මක කළ හැකිය. ඒ 
සඳහා මෙහෙයුම් පද්ධතියෙන් අවසර නොලැබෙන්නේ නම් `sinhala-font-correction.sh` file එකට 
ක්‍රියාත්මක වීමේ අවසරය දිය යුතුය (`chmod +x ./sinhala-font-correction.sh` විධානය ක්‍රියා කිරීමෙන්).

Script එක ක්‍රියා කරවීමෙන් පසු ලැබෙන උපදෙස් පිළිපදින්න. 

## ස්තුති කිරීමට අවශ්‍යද? 

+ [Hankyo Tutorials](https://www.youtube.com/channel/UCva_1artxqrL9oUcYAuZpIA) youtube channel එක follow කරන්න.
+ [slrootkit.blogspot.com](https://slrootkit.blogspot.com) තාක්ෂණික blog එක follow කරන්න. 

## උපකාර

Contact Adeepa: slrootkit@gmail.com (https://slrootkit.blogspot.com)<br/>
Contact Hankyo: hankyomail@gmail.com

Github Issue එකක් open කිරීමෙන් ද උපකාර ලබා ගත හැකිය. 
