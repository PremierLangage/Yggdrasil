extends = ../templates/AMC_TXT-rd.pl

author = Claire David
title = QCM langages reg - non reg

randomize_questions = on

#pour changer le nombre de questions
#nbstep = 6

intro ==
Ce quiz contient {{ nbstep }} questions.

Les langages suivants sont-il réguliers ou non réguliers?
==

questions=@ q-produit.txt


