# 22/04

+ ajout du script editor_hack.js pour corriger des bugs sur l'éditeur d'automate
+ import du script editor_hack.js dans le fichier base.pl
+ suppression de la variable deterministic dans editor.pl
+ l'éditeur d'automate est maintenant créé avant l'appel au script generate dans le before pour pouvoir modifier
ses propriétés (debug, editorHeight...) dans generate.
