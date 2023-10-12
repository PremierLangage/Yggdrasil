# Date : 16/06/2022
# Auteur : Clément Gaudet

# Ceci est un template pour faire des exercices interactifs multilangages
doc==
Ce template permet d'écrire des exercices pouvant être résolus dans un langage au choix de l'étudiant.

Par rapport à la version basique, celle-ci permet plus d'interactivité avec le programme étudiant en réalisant plus qu'une seule entrée, et une seule sortie.
Cela nécessite cependant d'écrire un script Python permettant de communiquer avec et d'évaluer le programme de l'étudiant et est donc plus complexe dans son utilisation.

Trois éléments sont à définir dans l'exercice:

***** evalscript *****

Script Python devant contenir une fonction evalscript servant à évaluer le script étudiant. Des imports peuvent être réalisés ici au besoin.

Cette fonction nécessite <b>un prototype précis</b>:

<b>async def evalscript(student, *args):</b>

Il s'agit d'une fonction asynchrone, nécessitant donc le mot clé async, et le premier argument doit être réservé pour récupérer le processus étudiant.
Un nombre arbitraire d'autres arguments peut être ajouté pour paramétrer l'évaluation notamment pour les tests.

Cette fonction doit renvoyer un triplet de la forme (result, got want) : result est un booléen indiquant si le test passe ou pas, got est une chaine de caractères
indiquant ce qui a été obtenu par le processus étudiant, want est une chaine de caractères indiquant ce qui était voulu. Ces informations sont utilisées pour l'affichage

Pour interagir avec le processus étudiant, 3 méthodes sont disponibles :

* student.send(*args) : cette méthode permet d'envoyer une ou des chaines de caractères au processus via son entrée standard
Des \n sont ajoutés entre les différents arguments et à la fin de la dernier chaine automatiquement. 
De plus, si les arguments sont automatiquement changés en leur représentation sous forme de chaine de caractère

* student.receive(timeout=1) : cette méthode attend de récupérer une ligne complète sur la sortie standard du processus. Un timeout de 1 seconde est mise par défaut,
celui-ci peut être changé au besoin. En cas de timeout, le test est automatiquent mis comme échoué

* student.query(query, timeout=1) : méthode raccourci qui à la fois envoie une chaine de caractère (\n rajouté automatiquement si besoin) et attend une réponse directement après

Ces méthodes doivent être appelées avec le mot-clé await car elles sont asynchrones

***** testcases *****

Ceci doit être une liste Python contenant les différents cas de tests à réaliser. Chaque test a le format suivant:
[(tuple contenant les différents arguments à passer à evalscript), "nom du test"]

Chaque test est automatiquement réalisé lorsque l'étudiant envoie son code, après compilation si celle-ci passe.

***** langages *****

Liste des langages autorisés. Si vous laissez cette variable vide, tout les langages seront disponibles.
Sinon, indiquez les langages souhaités, un par ligne

La liste des langages utilisables actuellement est : c, cpp, python, java, ocaml

La variable before peut être utilisée pour exécuter un script Python pendant la construction de l'exercice.

<b>Attention : il n'y pas de protection contre les deadlocks pouvant être occasionnés par la communication par tubes.
Ainsi, il ne faut pas tenter de communication bilatérale simultanée, et ne procéder que par requete/réponse.</b>
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