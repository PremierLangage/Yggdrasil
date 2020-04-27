



extends= /model/qcm/qcm.pl




nb % 4 # nombre de proposition 
nbtrues % 1 # une bonne réponse 

title=signaux


condensateur=$ condensateur.png
rep1=$ rep1.png
rep2=$ rep2.png
rep3=$ rep3.png
rep4=$ rep4.png



text==

On considère le condensateur 
<center><img src={{ condensateur }} alt='image du condensateur !'  /></center><br />

![image]({{ condensateur }})
==

# style=\"width:50px;height:100px;\"


good==
![image]({{ rep1 }})
==
bad==
![image]({{ rep2 }})
![image]({{ rep2 }})
![image]({{ rep2 }})
==


