#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# author=Nicolas Borie

title=Assistant générateur de rapport de review de code
tag=review|code|relecture|validation|correction|évaluation|pairs

group =: RadioGroup

before==#|python|

# step index 
step = 0

# Les énoncés
texts=["## **Bienvenu sur l'assistant online d'aide à la génération de rapport pour la review "
       "de code en langage C.**\n<br />\n"
       "Commencez par vous présenter, précisez l'auteur du code reviewé ainsi qu'une description pour "
       "la production évaluée. Prennez votre temps pour valider pas à pas votre rapport mais "
       "n'actualiser la page à aucun moment, vous perdriez votre début de rapport et cela "
       "réinitialiserait le générateur à la première étape.",
       "## **Concision et propreté des productions en programmation**\n<br />\n"
       "<u>Objectifs :</u>"
       "<ul>"
       "<li>Concevoir des packages propres, les plus légers possibles et complets.</li>"
       "<li>Adopter des organisations de sources favorisant les recherches.</li>"
       "</ul>"
       "<b>Comment sont les productions transmises en terme de qualité, taille, "
       "structuration, organisation des répertoires et fichiers transmis pour "
       "la revue ?</b>",
       "## **Installation et compilation des sources transmises**\n<br />\n"
       "<u>Objectifs :</u>"
       "<ul>"
       "<li>Le relecteur/client peut installer/compiler sans aucun effort.</li>"
       "<li>Fournir un makefile permettant une gestion fine des contenus.</li>"
       "</ul>"
       "<b>Comment sont les productions transmises en terme de praticité "
       "d’installation, de compilation des sources et contenus annexes ?</b>",
       "## **Fonctionnalités implantées dans les rendus**\n<br />\n"
       "<u>Objectifs :</u>"
       "<ul>"
       "<li>Les fonctionnalités programmées se comportent comme attendu voire comme spécifié dans le cahier des charges.</li>"
       "<li>Les productions réalisent exhaustivement les fonctionnalités souhaités.</li>"
       "</ul>"
       "<b>Les programmes réalisent-ils correctement et exhaustivement la liste des fonctionnalités à traiter ?</b>",
       "## **Utilisation et sécurité des programmes produits**\n<br />\n"
       "<u>Objectifs :</u>"
       "<ul>"
       "<li>Produire des exécutables robustes contrôlant systématiquement données en entrées et exécutions.</li>"
       "<li>Augmenter l’expérience de l’utilisateur en le conseillant ou en le corrigeant.</li>"
       "</ul>"
       "<b>Les programmes prévoient-ils exhaustivement tous les cas d'utilisation ?</b>",
       "## **Nommage des éléments dans les productions rendues**\n<br />\n"
       "<u>Objectifs :</u>"
       "<ul>"
       "<li>Adopter des règles de moindre surprise favorisant la compréhension lors de toutes relectures par autrui.</li>"
       "<li>Produire du code réutilisable et maintenable par autrui.</li>"
       "</ul>"
       "<b>Les éléments (modules, fonctions, variables, constantes, etc...) des productions informatiques ont-ils des noms ou identifiants qui décrivent fidèlement leur contenu ?</b>",
       "## **Efficacité et performance des productions rendues**\n<br />\n"
       "<u>Objectifs :</u>"
       "<ul>"
       "<li>Produire des programmes efficaces.</li>"
       "<li>Mettre en oeuvre des algorithmes standards et éprouvés.</li>"
       "</ul>"
       "<b>Les programmes déploient-ils des algorithmes raisonnables et efficaces ?</b>",
       "## **Commentaires dans les sources des productions rendues**\n<br />\n"
       "<u>Objectifs :</u>"
       "<ul>"
       "<li>Produire du code optimisé pour toutes relectures.</li>"
       "<li>Produire du code réutilisable et maintenable par autrui.</li>"
       "</ul>"
       "<b>Les sources des programmes et productions sont elles correctement commentées ?</b>",
       "## Avez-vous des derniers commentaires ou informations supplémentaires à donner ?"]

forms=['<table style="border-spacing: 30px; border-collapse: separate;">'
       '<tr><td>Votre <b>nom</b> (en tant que relecteur) </td><td> <input type=text id="form_nom" /> </td></tr>'
       '<tr><td>Nom de l\'<b>auteur</b> de la production </td><td> <input type=text id="form_author" /> </td></tr>'
       '<tr><td>Nom du code ou <b>projet</b> relu </td><td> <input type=text id="form_code" /> </td></tr>'
       '</table>',
       ' {{ group|component }} \n<br />\n'
       ' Précisions le cas échéant (en particulier si vous avez des suggestions d\'amélioration) : <br /> '
       '<textarea id="form_comcrit1" rows="6" cols="80" ></textarea>',
       ' {{ group|component }} \n<br />\n'
       ' Précisions le cas échéant (en particulier si vous avez des suggestions d\'amélioration) : <br /> '
       '<textarea id="form_comcrit2" rows="6" cols="80" ></textarea>',
       ' {{ group|component }} \n<br />\n'
       ' Précisions le cas échéant (en particulier si vous avez des suggestions d\'amélioration) : <br /> '
       '<textarea id="form_comcrit3" rows="6" cols="80" ></textarea>',
       ' {{ group|component }} \n<br />\n'
       ' Précisions le cas échéant (en particulier si vous avez des suggestions d\'amélioration) : <br /> '
       '<textarea id="form_comcrit4" rows="6" cols="80" ></textarea>',
       ' {{ group|component }} \n<br />\n'
       ' Précisions le cas échéant (en particulier si vous avez des suggestions d\'amélioration) : <br /> '
       '<textarea id="form_comcrit5" rows="6" cols="80" ></textarea>',
       ' {{ group|component }} \n<br />\n'
       ' Précisions le cas échéant (en particulier si vous avez des suggestions d\'amélioration) : <br /> '
       '<textarea id="form_comcrit6" rows="6" cols="80" ></textarea>',
       ' {{ group|component }} \n<br />\n'
       ' Précisions le cas échéant (en particulier si vous avez des suggestions d\'amélioration) : <br /> '
       '<textarea id="form_comcrit7" rows="6" cols="80" ></textarea>',
       'Commentaires ouverts : <br /> '
       '<textarea id="form_comments" rows="6" cols="80" ></textarea>']

report=""

text='<b><span style="color: darkred;">Étape '+str(step+1)+'/9</span></b><br/><br />\n\n'+texts[step]
form=forms[step]
==

evaluator==#|python|
from datetime import date

mois=["janvier", "février", "mars", "avril", 
      "mai", "juin", "juillet", "août", 
      "septembre", "octobre", "novembre", "décembre"]

if step == 0:
    report += "# Rapport de relecture de code\n\n"
    if len(response['code']) > 0:
        report += "Production soumise à la relecture : **"+response['code']+"**\n"
    if len(response['author']) > 0:
        report += "Projet/code produit par **"+response['author']+"**\n"
    report += "Relecture opérée"
    if len(response['nom']) > 0:
        report += " par **"+response['nom']+"**"
    report += " le "+str(date.today().day)+" "+mois[date.today().month - 1]+" "+str(date.today().year)
    report += "\n\n"
    step += 1
    text='<b><span style="color: darkred;">Étape '+str(step+1)+'/9</span></b><br/><br />\n\n'+texts[step]
    form=forms[step]
    group.items = []
    group.items.append({
        "id": "crit1fail",
        "content": "L'auteur a laissé des éléments inutiles ou des fichiers mal identifiés dans ses contenus."
    })
    group.items.append({
        "id": "crit1ok",
        "content": "Les productions transmises et leurs éléments sont corrects et bien identifiés."
    })
    group.items.append({
        "id": "crit1ok+",
        "content": "Les productions transmises sont particulièrement bien structurées et la précision du nommage <br />ne laisse aucun doute sur le contenu des répertoires et fichiers."
    })
    group.items.append({
        "id": "crit1ok++",
        "content": "Les contenus transmis sont à la fois concis et complets. Un maximum d'éléments sont générés <br />automatiquement rendant la production minimale en taille lors de sa diffusion."
    })
    grade=(-1, " ")
elif step == 1:
    report += "## Concision et propreté des rendus\n\n"
    S = group.selection
    for item in group.items:
        if item['id'] == S:
            report += item['content']+"\n\n"
    if 'comcrit1' in response and len(response['comcrit1']) > 0:
        report += response['comcrit1']+"\n\n"
    step += 1
    text='<b><span style="color: darkred;">Étape '+str(step+1)+'/9</span></b><br/><br />\n\n'+texts[step]
    form=forms[step]
    group.items = []
    group.items.append({
        "id": "crit2fail",
        "content": "Pas de makefile ou la compilation d'un programme échoue ou la compilation <br/>manque de vérifications ou produit trop de warning."
    })
    group.items.append({
        "id": "crit2ok",
        "content": "Un makefile permet la compilation de toutes les sources sans grave warning et avec, a minima, le flag -Wall."
    })
    group.items.append({
        "id": "crit2ok+",
        "content": "Un makefile propre, lisible et complet permet la compilation de toutes les sources sans aucun warning <br />et avec les drapeaux -Wall et -ansi (voire -pedantic). Le makefile gère correctement les dépendances <br />et intègre une règle pour le nettoyage des produits de compilation."
    })
    group.items.append({
        "id": "crit2ok++",
        "content": "Le makefile est bien documenté, il propose un haut niveau de verbose et intègre des règles <br />pour générer un ou plusieurs contenus annexes (documentation avec doxygen, <br />programme de tests supplémentaires, etc)."
    })
    grade=(-1, " ")
elif step == 2:
    report += "## Installation et compilation des sources transmises\n\n"
    S = group.selection
    for item in group.items:
        if item['id'] == S:
            report += item['content']+"\n\n"
    if 'comcrit2' in response and len(response['comcrit2']) > 0:
        report += response['comcrit2']+"\n\n"
    step += 1
    text='<b><span style="color: darkred;">Étape '+str(step+1)+'/9</span></b><br/><br />\n\n'+texts[step]
    form=forms[step]
    group.items = []
    group.items.append({
        "id": "crit3fail",
        "content": "Une des fonctionnalité n'est pas implantée correctement."
    })
    group.items.append({
        "id": "crit3ok",
        "content": "Les programmes répondent correctement à toutes les tâches qu'ils sont censés effectuer."
    })
    group.items.append({
        "id": "crit3ok+",
        "content": "Les programmes contiennent quelques preuves de leurs bons fonctionnements."
    })
    group.items.append({
        "id": "crit3ok++",
        "content": "Les programmes démontrent, durant leurs exécutions, qu'ils réalisent correctement l'intégralité <br />du cahier des charges."
    })
    grade=(-1, " ")
elif step == 3:
    report += "## Fonctionnalités implantées dans les rendus\n\n"
    S = group.selection
    for item in group.items:
        if item['id'] == S:
            report += item['content']+"\n\n"
    if 'comcrit3' in response and len(response['comcrit3']) > 0:
        report += response['comcrit3']+"\n\n"
    step += 1
    text='<b><span style="color: darkred;">Étape '+str(step+1)+'/9</span></b><br/><br />\n\n'+texts[step]
    form=forms[step]
    group.items = []
    group.items.append({
        "id": "crit4fail",
        "content": ""
    })
    group.items.append({
        "id": "crit4ok",
        "content": ""
    })
    group.items.append({
        "id": "crit4ok+",
        "content": ""
    })
    group.items.append({
        "id": "crit4ok++",
        "content": ""
    })
    grade=(-1, " ")
else:
    if len(response['comments']) > 0:
        report += "## derniers commentaires :\n\n" + response['comments']
    text=""
    form=""
    grade=(100, "C'est fini !<br /><br /><u><b>Rapport généré en markdown :</b></u><br /><br /><pre>"+report+"</pre>")

==

# the two following keys will be overwriten over and over...
text=""
form=""


