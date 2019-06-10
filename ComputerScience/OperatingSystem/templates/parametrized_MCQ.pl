title= qcm template

text== 
Ce texte ne devrait jamais apparaitre, le template de QCM paramétré semble ne 
pas être utilisé correctement.
==

form== 
Le formulaire doit être absolument écrasé par le builder, si ce n'est pas le 
cas et que ce texte apparait ; alors le template parametrized_MCQ.pl n'est pas 
utilisé correctement.
==

@ lib:/utils/sandboxio.py
@ utils.py

@ parametrized_MCQ_build.py [builder.py]
@ parametrized_MCQ_evaluator.py [grader.py]

data_from_file=None



