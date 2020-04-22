# 22/04

+ modification de la méthode from_object_notation dans le script automaton.py pour standardiser l'automate l'automate en paramètre
+ ajout du script editor_hack.js pour corriger des bugs sur l'éditeur d'automate
+ import du script editor_hack.js dans le fichier base.pl
+ suppression de la variable deterministic dans editor.pl
+ l'éditeur d'automate est maintenant créé avant l'appel au script generate dans le before pour pouvoir modifier ses propriétés (debug, editorHeight...) dans generate.
