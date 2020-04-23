# 22/04

+ modification de la méthode from_object_notation dans le script automaton.py pour standardiser l'automate l'automate en paramètre
+ ajout du script editor_hack.js pour corriger des bugs sur l'éditeur d'automate
+ import du script editor_hack.js dans le fichier base.pl
+ suppression de la variable deterministic dans editor.pl
+ l'éditeur d'automate est maintenant créé avant l'appel au script generate dans le before pour pouvoir modifier ses propriétés (debug, editorHeight...) dans generate.


# 23/04
+ ajout de la propriété textSetInitial au composant AutomatonEditor pour changer le texte du bouton "état initial"
+ ajout de la propriété textSetNonInitial au composant AutomatonEditor pour changer le texte du bouton "état non initial"
+ ajout de la propriété textSetFinal au composant AutomatonEditor pour changer le texte du bouton "état final"
+ ajout de la propriété textSetNonFinal au composant AutomatonEditor pour changer le texte du bouton "état non final"
+ ajout de la propriété textRenameState au composant AutomatonEditor pour changer le texte du bouton "renommer état"
+ ajout de la propriété textDeleteState au composant AutomatonEditor pour changer le texte du bouton "supprimer état" 
+ ajout de la propriété textRenameSymbol au composant AutomatonEditor pour changer le texte du bouton "renomer étiquette"
+ ajout de la propriété textDeleteSymbol au composant AutomatonEditor pour changer le texte du bouton "supprimer étiquette"
