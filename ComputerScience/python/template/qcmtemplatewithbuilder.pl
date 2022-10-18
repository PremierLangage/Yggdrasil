
title= Ne pas utiliser  directement



doc==
Permet d'utiliser la balise before pour construire la question

il faut que before  intialise
 text, good, bad

==

text= Votre question ?


form=dummy for the pl grammar the builder is making the form

feedback.success=<div class="btn-success"> Voila votre resultat : {{  evaluation }} </div>

feedback.failure=<div class="btn-danger"> Voila votre resultat : {{  evaluation }} </div>


builder=@ qcmbuilder.py
grader=@qcm_evaluator.py
@ /utils/sandboxio.py

settings.allow_reroll=doit


before==

good='vrai\ntrue\nright\neffectivement'
bad='faux\nbad\nmauvais\nnon non non'
text='Cocher les éléments vrais'

==
