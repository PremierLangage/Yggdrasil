@ csvreader.py
@ exercices.csv

title= Chimie
text==
Donnez les produits obtenus dans la réaction suivante : 
<center>{{svg}}</center>
==
form=@ jsmolform.html

before==
import csvreader
line = csvreader.randomline('exercices.csv')
nom=line['nom']
svg=line['svg']
react=line['react']
==

grader=@ /grader/evaluator.py
evaluator==
grade=(0," C'est pas ça ! Essaillez autre chose")
'''
if type(reponse['answer']) == dict:
    student=set(reponse['answer'].value())
prof=set()
for i in range(1,5):
    if dic['produit'+str(i)] != '' :
        prof.add(dic['produit'+str(i)])

if student == prof :
    grade=(100,"bravo")
else:
    prof=set()
    for i in range(1,3):
        if dic['produit faux'+str(i)] != '' :
            prof.add(dic['produit'+str(i)])
    if student == prof :
        grade=(0," C'est pas ça ! "+dic['feedback1'])
    else:
        prof=set()
        for i in range(3,5):
            if dic['produit faux'+str(i)] != '' :
                prof.add(dic['produit faux'+str(i)])
        if student == prof :
            grade=(0," C'est pas ça ! "+dic['feedback1'])
        else:
            grade=(0," C'est pas ça ! Essaillez autre chose")
'''
==

builder=@ /builder/before.py
@ /utils/sandboxio.py








