extends = /model/basic/inputselect.pl

@ grec_voc_1.csv [data.csv]

title = Vocabulaire grec

before ==
with open('data.csv') as f:
    row = csv_rand(f, delimiter=";")
    items = csv_col(f, "traductions", delimiter=";")
article = row['article']
mot = row['mot']
sol = row['traductions']
==

text ==
Que signifie le mot suivant ?
{{article}} {{mot}}
<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{article}} {{mot}}
</div>
==

solution ==
{{traductions}}
==




