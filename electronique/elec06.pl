



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

![image]({{ condensateur }})
==



good==
<center><img src={{ rep1 }} alt='image du condensateur !'  /></center>
==
bad==
<center><img src={{ rep2 }} alt='image du condensateur !'  /></center>
<center><img src={{ rep3 }} alt='image du condensateur !'  /></center>
<center><img src={{ rep4 }} alt='image du condensateur !'  /></center>
==


