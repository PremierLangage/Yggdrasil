
#import pour intéractions avec bdd
@database_utils.py
@ /builder/before.py [builder.py]

extends = /AAAA/Thomas/template/pltest.pl

author = Thomas SAILLARD

title = Exercice python sur les listes (test pour intéraction avec la base de données)

text==
Ecrire une fonction `sum_of_positive` qui prend en argument une liste d'entiers et qui 
renvoie la somme des entiers positifs de cette liste.
==

editor.code ==#|py|
from typing import List

def sum_of_positive(l : List[int]) -> int : 
    # write your code here
==

pltest==
>>> sum_of_positive == sum_of_positive # La fonction existe ?
True
>>> sum_of_positive([]) == 0 # La fonction renvoie 0 si on lui passe une liste vide
True
>>> sum_of_positive([-1, -67, -998]) == 0 # La fonction renvoie 0 si on lui passe des entiers négatifs
True
>>> from random import sample #
>>> l = sample(range(-1000, 1000), 200) #
>>> sum_of_positive(l) == sum(i for i in l if i > 0) # La fonction s'execute comme la solution
True
==


before==#|py|
from database_utils import get_session, Base, Response


with get_session(table_class= Response, base=Base) as session:
    if session.query(Response).filter(Response.student_id == user__id).first() : 
        form = ''
        text = 'Vous avez déjà soumis une réponse. Veuillez passer à la partie correction'

del session
==


after==#|py|
from database_utils import get_session, Base, Response
from sqlalchemy import Column, String, Integer

if int(grade) == 100:
    with get_session(table_class = Response, base=Base) as session:
        session.add(Response(student_id = user__id if user__id else session__id, value = answer))
        session.commit()
==

