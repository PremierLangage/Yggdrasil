
author=NB
title=Votre premier exercice pas à pas

form==

==


text==
# TUTO PL 

## Introduction 

Ce tutoriel vous propose d'apprendre à utiliser Premier Langage en 
réalisant un exercice de Premier Langage vous-même ! Vous serez donc, 
durant un instant, l'élève pour apprendre à concevoir de nouvelles 
ressources pédagogiques.

Un exercice Premier Langage est d'abord un fichier vide avec un nom 
qui se termine par l'extension **.pl** (**mon_permier_exo.pl** par exemple), 
ainsi, nous allons partir d'un fichier vide et c'est vous qui allez fabriquer
ce nouvel exercice en suivant les consignes.

Comme vous allez écrire du texte pour construire ce nouvel exercice
et que ce texte va modifier votre exercice, à partir de maintenant, 
je vous parlerai en gras et en vert.

<font color="DarkGreen"><b>Cliquer sur Validez pour passer à la prochaine étape</b></font>
== 

@ /utils/sandboxio.py

grader==#|python|
import sys
from sandboxio import *

def make_file_exo(str):
    return """<font color=\"DarkGreen\"><b>Voici votre fichier exercice :<b></font><br/>
    <table width=\"80%\" cellpadding=\"2px\" border=\"1px black\"><tr><td><code>
    <font color=\"DarkRed\">"""+str+"""</font></code></td></tr></table>"""

if __name__ == "__main__":
    context = get_context()
    answers = get_answers()

    if 'step' not in context:
        context['step'] = 1
    else:
        context['step'] += 1

    # STEP I : Give a title
    if context['step'] == 1:
        context['title'] = ""
        context['text'] = " Merci de vous engager dans la création d'exercice ;)\n"
        context['text_exo'] = "Votre fichier est, pour le moment, vide..."
        context['text'] += "<br />"+make_file_exo(context['text_exo'])
        context['text'] += "<br /><font color=\"DarkGreen\"><b>Votre exercice n'a ni titre, ni énoncé. C'est un peu triste... Commencez par donner un titre pour votre exercice. Pour cela, remplissez avec, ce que vous voulez, le champ texte suivant. Vous cliquerez ensuite sur valider pour passer à la prochaine étape.</b></font>"

        context['form'] = "<font color=\"DarkGreen\"><b>Votre titre : </b></font><input type=\"text\" id=\"form_title_exo\">"

    # STEP II : Update the title
    if context['step'] == 2:
        context['title'] = answers['title_exo']
        context['text'] = ""
        context['text_exo'] = "title=\""+str(answers['title_exo'])+"\""
        context['text'] += "<br />"+make_file_exo(context['text_exo'])
        context['text'] += "<br /><font color=\"DarkGreen\"><b>Super! Ce titre, normalement écrit en noir, provient de vous. C'est en fait la première ligne de votre fichier exercice qui a généré ce titre. Un fichier exercice Premier Langage est principalement constitué de déclaration de type clé=valeur. Ici, title=... définit un titre pour votre exercice.</b></font>"
        context['text'] += "<br /><font color=\"DarkGreen\"><b>Cliquez sur Valider pour continuer.</b></font>"

        context['form'] = ""

    # STEP III : Ask for a text
    if context['step'] == 3:
        context['text'] = ""
        context['text'] += "<br />"+make_file_exo(context['text_exo'])
        context['text'] += "<br /><font color=\"DarkGreen\"><b>Vous allez maintenant devoir produire le coeur de l'énoncé de votre exercice : sa consigne. Pour cela, il faut spécifier une valeur pour la clé 'text'. Pour ce premier exercice, demandez à l'élève de fournir son prénom.</b></font>"
        context['text'] += "<br /><font color=\"DarkGreen\"><b>Précisez votre énoncé dans la zone de capture suivante. Vous pouvez utiliser plusieurs lignes.</b></font>"

        context['form'] = "<textarea id=\"form_text_exo\" rows=\"5\" cols=\"50\">\nMettez ici vos consignes...\n</textarea>"

    # STEP IV : Update the exercice text
    if context['step'] == 4:
        context['text_exo'] += "<br /><br />text==<br />"+answers['text_exo']+"<br/>=="
        context['text_exo_text'] = answers['text_exo']
        context['text'] = context['text_exo_text']
        context['text'] += "<br/><br />"+make_file_exo(context['text_exo'])
        context['text'] += "<br /><font color=\"DarkGreen\"><b>Ce coup-ci, votre fichier exercice précise la valeur d'une clé 'text'. Cette notation avec double égal text== ... == permet d'utiliser autant de lignes que vous souhaitez. Alors que le simple égal, c'est pour les valeurs sur une seule ligne.</b></font>"
        context['text'] += "<br /><font color=\"DarkGreen\"><b>Un titre, une consigne, mais rien pour répondre ! Il est temps de rajouter un formulaire dans votre énoncé... Ce formulaire est un peu technique, nous sommes sur un navigateur internet et donc ce formulaire sera de type HTML. Valider pour continuer.</b></font>"
        context['form'] = ""

    # STEP V : Give an HTML form
    if context['step'] == 5:
        context['text'] = context['text_exo_text']
        context['text'] += "<br/><br />"+make_file_exo(context['text_exo'])
        context['text'] += "<br /><font color=\"DarkGreen\"><b>Pour devenir un expert de Premier Langage, il vous faudra maitriser ces formulaires HTML. Toutefois, sachez que la plupart des exercices ne demandent que des mots tappés au clavier ou encore des chiffres. Globalement les inputs de type text et autre cases à cocher suffisent pour la plupart des enseignants éditeurs de ressources.</b></font>"
        context['text'] += "<br /><font color=\"DarkGreen\"><b>Aujourd'hui, c'est moi qui va vous macher le travail. Je vais vous créer un formulaire de type text mais c'est vous qui allez préciser un identifiant unique pour ce champ de réponse.</b></font>"
        context['form'] = "<font color=\"DarkGreen\"><b>Identifiant pour le prénom de l'élève : </b></font><input type=\"text\" id=\"form_id_prenom_exo\">"

    # STEP VI : Update user HTML form
    if context['step'] == 6:
        context['text_exo'] += "<br/>form==<br/>Votre prénom : &lt;input type=\"text\" id=\"form_"+answers['id_prenom_exo']+"\"&gt;<br/>=="
        context['text_exo_text'] += "<br \>Votre prénom : <input type=\"text\" id=\"form_"+answers['id_prenom_exo']+"\">"
        context['text'] = context['text_exo_text']
        context['text'] += "<br/><br />"+make_file_exo(context['text_exo'])
        context['text'] += "<br /><font color=\"DarkGreen\"><b>Votre exercice est maintenant complet coté élève. Il y a un titre, une consigne et une zone réponse. Remarquez que j'ai rajouté 'form_' avant votre identifiant de champ de réponse. On aurait pu mettre plus de zones de saisie, voire des champs de réponse de natures différentes. Permier Langage peut techniquement récupérer tout ce qu'un navigateur Web pourrait récupérer.</b></font>"
        context['text'] += "<br /><font color=\"DarkGreen\"><b>C'est encore moi qui contrôle le bouton Valider et votre exercice n'est pas encore fini ! On va finir par la chose la plus compliquée : le grader. Le grader est un programme python qui doit récupérer les réponses de vos élèves pour les évaluer en y attribuant une note et en donnant un feedback à l'élève. Cliquer sur Valider pour continuer.</b></font>"

        context['form'] = ""

    # STEP VI : Explain grader
    if context['step'] == 7:
        context['text'] = context['text_exo_text']
        context['text'] += "<br/><br />"+make_file_exo(context['text_exo'])
        context['text'] += "<br /><font color=\"DarkGreen\"><b>Le grader est un programme Python. Pour écrire de vrais graders évolués et originaux, vous devrez maitriser le langage Python un petit peu. Mais Premier Langage est désigné de manière à éviter ce travail pénible. Vous verrez que de nombreux graders sont déjà disponibles et que Premier Langage incite à réutiliser des graders déjà existants plutot que d'en recoder des nouveaux...</b></font>"
        context['text'] += "<br /><font color=\"DarkGreen\"><b>Ici, pour faire un exercice relativement minimal et autonome,"
        context['text'] += " je vais coder pour vous un grader très simple : il donne la meilleure note à tout le monde."
        context['text'] += " Toutefois, c'est vous qui devrez fabriquer le feedback personnalisé.</b></font>"

    # STEP VII : Add grader I
    if context['step'] == 8:
        context['text'] = context['text_exo_text']
        context['form']="""<div class="input-group">
    <input id="form_grader" type="text" class="form-control" placeholder="grade=(100,' votre feedback personalisé')" required>
</div>"""
        context['text'] += """<br /><font color=\"DarkGreen\"><b>Le grader est un programme Python.
        Pour écrire de vrais graders évolués et originaux, vous devrez maitriser le langage Python un petit peu.
        Mais Premier Langage est désigné de manière à éviter ce travail pénible.
        Vous verrez que de nombreux graders sont déjà disponibles et que Premier Langage incite à réutiliser des graders
        déjà existants plutot que d'en recoder des nouveaux...</b></font>"""
        

    output(-1, " ", context)
==








