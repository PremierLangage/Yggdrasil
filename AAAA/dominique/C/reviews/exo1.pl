
@ /utils/sandboxio.py
@ /AAAA/dominique/utils/drutils.py 
title=
text=
form=

builder=@ /builder/bbefore.py
grader=


first==
## **Bienvenu sur l'assistant online d'aide à la génération de rapport pour la review de code en langage C.**
<br />
Commencez par vous présenter, précisez l'auteur du code reviewé ainsi qu'une description pour la production évaluée.

Prennez votre temps pour valider pas à pas votre rapport mais ATTENTION n'actualiser la page à aucun moment, vous perdriez votre début de rapport et cela réinitialiserait le générateur à la première étape.
==



before==
from drutils import raiseifabsent, buildform

raiseifabsent('texts', ' Liste de critères ')
texts = first + texts
raiseifabsent('formfills','liste de choix des différents critères ')
forms = firstform + buildform(formfills)

==


evaluator==

if step==0:
    report = "# Rapport de relecture de code\n\n"
    report_html = "<h1>Rapport de relecture de code</h1><br />"
    if len(response['code']) > 0:
        report += "Production soumise à la relecture : **"+response['code']+"**\n"
        report_html += "Production soumise à la relecture : <b>"+response['code']+"</b><br />"
    if len(response['author']) > 0:
        report += "Projet/code produit par **"+response['author']+"**\n"
        report_html += "Projet/code produit par <b>"+response['author']+"</b><br />"
    report += "Relecture opérée"
    report_html += "Relecture opérée"
    if len(response['nom']) > 0:
        report += " par **"+response['nom']+"**"
        report_html += " par <b>"+response['nom']+"</b>"
    report += " le "+str(date.today().day)+" "+mois[date.today().month - 1]+" "+str(date.today().year)
    report_html += " le "+str(date.today().day)+" "+mois[date.today().month - 1]+" "+str(date.today().year)
    report += "\n\n"
    report_html += "<br /><br />"

if step <len(texts):
    
    form=f''' {{ group|component }} \n<br />\nPrécisions le cas échéant (en particulier si vous avez des suggestions d\'amélioration) : <br /> 
       '<textarea id="form_comcrit{step}" rows="6" cols="80" ></textarea>'''

==