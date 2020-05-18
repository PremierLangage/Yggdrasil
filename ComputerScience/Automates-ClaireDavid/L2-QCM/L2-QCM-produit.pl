
extends = ../templates/AMC_TXT-rd.pl

author = Claire David
title = QCM Produit d'automates

randomize_questions = off

#pour changer le nombre de questions
#nbstep = 6

intro ==
Ce QCM contient {{ nbstep }} questions.

Pour les questions de type Vrai/Faux, vous devez choisir une réponse.

Pour les autres, la réponse complète peut être composée de plusieurs éléments.
==

questions=@ q-produit.txt



