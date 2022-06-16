
# Ceci est un template pour faire des exercices avec la balise de correction cgtest
# Il s'agit d'une adaptation du template pltest
doc==
Ce template permet d'écrire des exercices pouvant être résolus dans un langage au choix de l'étudiant.

Par rapport à la version basique, celle-ci permet plus d'interactivité avec le programme étudiant en réalisant plus qu'une seule entrée, et une seule sortie.
Cela nécessite cependant d'écrire un script Python permettant de communiquer avec et d'évaluer le programme de l'étudiant et est donc plus complexe dans son utilisation.

Deux éléments sont à définir dans l'exercice:

***** evalscript *****

Script Python devant contenir une fonction evalscript servant à évaluer le script étudiant. Des imports peuvent être réalisés ici au besoin.

Cette fonction nécessite <b>ce prototype précis</b>:

<b>async def evalscript(student, *args):</b>

Il s'agit d'une fonction asynchrone, nécessitant donc le mot clé async, et le premier argument doit être réservé pour récupérer le processus étudiant.
Un nombre arbitraire d'autres arguments peut être ajouté pour paramétrer l'évaluation notamment pour les tests.

Cette fonction doit renvoyer True si le test passe, False sinon.

Pour interagir avec le processus étudiant, 3 méthodes sont disponibles :

* student.send(*args) : cette méthode permet d'envoyer une ou des chaines de caractères au processus via son entrée standard
Des \n sont ajoutés entre les différents arguments et à la fin de la dernier chaine automatiquement

* student.receive(timeout=1) : cette méthode attend de récupérer une ligne complète sur la sortie standard du processus. Un timeout de 1 seconde est mise par défaut,
celui-ci peut être changé au besoin. En cas de timeout, le test est automatiquent mis comme échoué

* student.query(query, timeout=1) : méthode raccourci qui à la fois envoie une chaine de caractère (\n rajouté automatiquement si besoin) et attend une réponse directement après



La liste des langages utilisables actuellement est : c, cpp, python, java, ocaml
==
grader  =@ ./cginteractivegrader.py
builder =@ ./cgbuilder.py

@ ./utils/feedback2.py
@ ./utils/template.html
@ ./utils/langhandlers.py
@ ./utils/cginteractive.py
@ /utils/sandboxio.py

settings.allow_reroll = 1

editor =: CodeEditor
editor.theme = dark
editor.height = 500px

# une interface standard d'exercice avec un editeur pour la réponse
form==
{{editor|component}}
==

languages==
==