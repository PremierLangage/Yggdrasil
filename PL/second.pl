
template=./first.pl

title= Le titre 


code==

 text==
 Ajouter le nombre de pieds d'une chaise et d'une table.
 == 

==


text==
Nous avons défini le titre de notre exercice comme pour celui ci le titre est "{{ title }}".
Attention les clefs sont définies en anglais, donc title, author, text, etc.

Passons a un deuxième élément fondamental de notre exercice, l'énoncé la clef "text".

Supposons pour le moment que nous voulons juste faire faire un calcul mental élémentaire à notre étudiant.

<pre>{{code}}</pre>


==

editor.height=200

@ ./parsefortuto.py
@ ./exceptions.py


evaluator==
import parsefortuto as ps

d,w = ps.parse_file(response['student'])
if "text" in d:
    if "title" in d:
        grade= (100,"<p style='color:green;font-size:24px'> parfait vous avez pensé a mettre un titre</p>")
    else:
        grade=(50,"#"+str(w))
else:
    grade=(0,"# il faut un énoncé : text <br/>"+str(w))



==

