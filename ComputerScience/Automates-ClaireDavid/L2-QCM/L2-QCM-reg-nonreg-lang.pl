extends = ../templates/AMC_TXT-rd.pl

author = Claire David
title = QCM - régulier / non régulier ?

randomize_questions = on

#pour changer le nombre de questions
#nbstep = 10

intro ==
Ce QCM contient {{ nbstep }} questions.

Les langages suivants sont-il réguliers ou non réguliers?
==

questions=@ q-reg-nonreg-langages.txt


