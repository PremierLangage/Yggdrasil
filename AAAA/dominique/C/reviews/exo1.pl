
@ /utils/sandboxio.py
@ /AAAA/dominique/utils/drutils.py 
title=
text=
form=

builder=@ /builder/bbefore.py
grader=@/grader/evaluator.py

group =: RadioGroup



firstform==
<table style="border-spacing: 30px; border-collapse: separate;">
<tr><td>Votre <b>nom</b> (en tant que relecteur) </td><td> <input type=text id="form_nom" /> </td></tr>
<tr><td>Nom de l'<b>auteur</b> de la production </td><td> <input type=text id="form_author" /> </td></tr>
<tr><td>Nom du code ou <b>projet</b> relu </td><td> <input type=text id="form_code" /> </td></tr>
</table>
==

first==
## **Bienvenu sur l'assistant online d'aide à la génération de rapport pour la review de code en langage C.**
<br />
Commencez par vous présenter, précisez l'auteur du code reviewé ainsi qu'une description pour la production évaluée.

Prennez votre temps pour valider pas à pas votre rapport mais ATTENTION n'actualiser la page à aucun moment, vous perdriez votre début de rapport et cela réinitialiserait le générateur à la première étape.
==
before==
from drutils import raiseifabsent, additems

formfills=[["raté","correct","bien","très bien"],["echec","passable","bien","très bien"]]

texts=["critère1", "The other criture"]
titlecrit=["intro","Crit1","crit2"]
raiseifabsent('texts', ' Liste de critères ', globals())
texts = [first] + texts

raiseifabsent('formfills','liste de choix des différents critères ', globals())
forms = [firstform] + formfills

step=0
text=texts[step]
form=forms[step]

==


evaluator==
from drutils import raiseifabsent, additems

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

    import locale, time
    # locale.setlocale(locale.LC_ALL, 'fr_FR') # il faut une instalation de language pack sur la sandbox
    maintenant = time.strftime('%A %d %B %Y %H:%M:%S')
    report += " le "+maintenant 
    report_html += " le "+maintenant 
    report += "\n\n"
    report_html += "<br /><br />"
    step = 1
    text=texts[step]
    form="{{ group|component }} \n"+f''' <br />\nPrécisions le cas échéant (en particulier si vous avez des suggestions d\'amélioration) : <br /> 
    '<textarea id="form_comcrit{step}" rows="6" cols="80" ></textarea>'''
    group= additems(group,formfills[step], step)
    grade=(-1,"")


elif step <len(texts):
    report += "## {titlerecrit[step]} \n\n"
    report_html += "<b>Concision et propreté des rendus</b><br />"
    S = group.selection
    for item in group.items:
        if item['id'] == S:
            report += item['content']+"\n\n"
            report_html += item['content']+"<br /><br />"
    name=f'comcrit{step}'
    if name in response and len(response[name]) > 0:
        report += response[name]+"\n\n"
        report_html += response[name]+"<br /><br />"
    text=texts[step]
    form=f''' {{ group|component }} \n<br />\nPrécisions le cas échéant (en particulier si vous avez des suggestions d\'amélioration) : <br /> 
       '<textarea id="form_comcrit{step}" rows="6" cols="80" ></textarea>'''
    group= additems(group,formfills[step], step)
    grade=(-1,"")
    step+=1 

==