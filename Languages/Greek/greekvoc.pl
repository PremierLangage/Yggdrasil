extends = /model/basic/inputselect.pl

@ grec_voc_1.csv [data.csv]

title = Vocabulaire grec

before ==
f = open('data.csv', newline='')
    row = csv_choice(f, delimiter=";")
    f.seek(0)
    items = csv_col(f, "traductions", delimiter=";")
article = row['article']
mot = row['mot']
sol = row['traductions']
==

text ==
{{items}}
Que signifie le mot suivant ?
{{article}} {{mot}}
<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{article}} {{mot}}
</div>
==