#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Votre réponse ici
inputbox.appearance = outline

before==
import random

a = random.randint(1, 10)
b = random.randint(1, 10)
r = a + b
==

title==
Prototype d'exercice pour candidat
==

text==
Ceci est un prototype d'exo qui est cencé envoyé un résumé mail de l'exercice à une personne 
définie en dur dans le code source de l'exercice.
==

form==#|markdown|
<b>Qu'avez vous envie de nous dire ?</b>

<br><br>

{{ inputbox|component}}
==

evaluator==#|python|
import smtplib    ## Importation du module
serveur = smtplib.SMTP('smtp.gmail.com', 587)    ## Connexion au serveur sortant (en précisant son nom et son port)
serveur.starttls()    ## Spécification de la sécurisation
serveur.login("poutfou@gmail.com", "gnjdrr4530")    ## Authentification
message = inputbox.value    ## Message à envoyer
serveur.sendmail("Platon@univ-eiffel.com", "nicolas.borie@univ-eiffel.fr", message)    ## Envoie du message
serveur.quit()    ## Déconnexion du serveur


feedback = "Merci d'avoir validé correctement votre question! Votre réponse a bien été transmise..."

grade = (100, feedback)
==

