title= qcm template

text== 
Ce texte ne devrait jamais apparaitre, le template de qcm semble ne pas être 
utilisé correctement.
==

form== 
Le formulaire doit être absolument écrasé par le builder, si ce n'est pas le 
cas et que ce texte apparait ; alors le template qcm.pl n'est pas utilisé 
correctement.
==

@ /utils/sandboxio.py

builder=@ qcm_build.py
grader=@ qcm_evaluator.py

data_from_file=None

