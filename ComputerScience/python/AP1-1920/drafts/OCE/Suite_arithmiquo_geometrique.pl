# author=OCE

# Import à la sauce 'PL' des modules nécessaires pour faire l'import de "pltestgrader.py" dans le grader
@ /ComputerScience/python/AP1-1920/templates/utils/pltest_doc.py
@ /ComputerScience/python/AP1-1920/templates/utils/pltestgrader.py
@ /ComputerScience/python/AP1-1920/templates/utils/feedback2.py
@ /ComputerScience/python/AP1-1920/templates/utils/template.html
@ /utils/sandboxio.py
@ /builder/none.py [builder.py]
# fin des imports à la sauce 'PL'

# --- Conception de l'IHM
editor.fontsize=14
# une interface standard d'exercice avec un editeur pour la réponse
form=@ /form/text_editor.html

#settings.allow_reroll=1

title = Suite arithmético-géométrique

text==  
En utilisant une boucle "for in range", écrire un programme permettant d'afficher le Nème entier de la suite arithmético géométrique croissante suivante : 

$%
\begin{cases}
a & > 1\\\
b & > 0\\\
u_0 & > a\\\
u_{n+1} & = a\times u_n + b
\end{cases}
%$

Vous utiliserez impérativement les variables a, b, N et Uo <br>
pour a et b vous prendrez les valeurs : 2 et 3 <br>
Pour N la valeur 100 et pour Uo la valeur 1
==

editor.code== #|python|
# insérez votre code ici

# compléter les ??
print("le résultat est :",??)
==
# --- Fin de conception de l'IHM

# --- Mots clefs lié au fonctionnement de l'exercice
taboo=while
needed=for
# --- Fin Mots clefs lié au fonctionnement de l'exercice

# --- Partie liée à l'évaluation de l'exercice
grader==#|python|

import pltestgrader

dic = pltestgrader.get_context()
student = pltestgrader.get_answers()['answer']

# Vérification dans le code de l'étudiant de la non présence du taboo
if "taboo" in dic:
    if pltestgrader.checktaboo(dic['taboo'], student):
        pltestgrader.output(0, "ATTENTION : Le mot clef " + dic['taboo'] + " est proscrit.")
        sys.exit(1)
# Vérification dans le code de l'étudiant de la présence du needed
if "needed" in dic:
    if not pltestgrader.checktaboo(dic['needed'], student):
        pltestgrader.output(0, "ATTENTION : Le mot clef " + dic['needed'] + " est demandé.")
        sys.exit(1)

# executer le code de l'élève et comparer au résultat attendu
resultat=str(exec(student))
chaine = pltestgrader.re.sub("(\"(.|\n)*\"|#.*)", "", resultat) #enlève les commentaires et les chaînes de caractères
x=pltestgrader.re.sub('[a-z]',"",chaine)
correction="6338253001141147007483516026878"
if x == correction:
    pltestgrader.output(0, "OK")
    sys.exit(1)
else:
    pltestgrader.output(0, "Pas de chance")
    sys.exit(1)
==
# --- Fin Partie liée à l'évaluation de l'exercice










