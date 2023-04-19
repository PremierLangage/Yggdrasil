
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

lastform==
<table style="border-spacing: 30px; border-collapse: separate;">
<tr><td>Votre évaluation sur 1 à 100 </td><td> <input type=number min=1 max=100 id="form_note" value=100 /> </td></tr>
</table>

==




before==
from drutils import raiseifabsent, additems
from ast import literal_eval 

title =evaluateur["title"]
text = evaluateur["description"]
form = firstform


step=0


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
    CRIT=criteres[step]
    text=CRIT["description"]+" Step : "+str(step)
    title=CRIT["title"]
    form="{{ group|component }} \n"+f''' <br />\nPrécisions le cas échéant (en particulier si vous avez des suggestions d\'amélioration) : <br /> 
    '<textarea id="form_comcrit{step}" rows="6" cols="80" ></textarea>'''
    group= additems(group,CRIT["evals"], step)
    grade=(-1,"")


elif step <len(texts):
    report += f'## {CRIT["title"]} \n\n'
    report_html += f'<h2>{CRIT["title"]}</h2><br />'
    S = group.selection
    for item in group.items:
        if item['id'] == S:
            report += item['content']+"\n\n"
            report_html += item['content']+"<br /><br />"
    name=f'comcrit{step}'
    if name in response and len(response[name]) > 0:
        report += response[name]+"\n\n"
        report_html += response[name]+"<br /><br />"
    step+=1 
    if step == len(texts):
        text = report + report_html
        form=''
        step -= 1 
        grade=(100,"")
    else:
        CRIT=criteres[step]
        text=CRIT["description"]+" Step : "+str(step)
        title=CRIT["title"]
        form="{{ group|component }} \n"+f'''<br />\nPrécisions le cas échéant (en particulier si vous avez des suggestions d\'amélioration) : <br /> 
        '<textarea id="form_comcrit{step}" rows="6" cols="80" ></textarea>'''
        
        
        grade=(-1,"")
        
        group= additems(group,forms[step], step)



==