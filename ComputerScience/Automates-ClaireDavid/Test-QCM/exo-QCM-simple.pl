
extends = ../templates/AMC_TXT-rd.pl
#extends = /model/AMC_TXT.pl

title = QCM Produit d'automates

randomize_questions = on

intro ==
Ce quiz contient {{nbstep}} questions.

Pour les questions de type Vrai/Faux, vous devez choisir une réponse.

Pour les autres, la réponse complète peut être composée de plusieurs items.
==



questions=@ questions.txt



