@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/bbefore.py

@database_utils.py

editor =: CodeEditor
editor.code ==#|py|
from typing import List

def sum_of_positive(l : List[int]) -> int : 
    # write your code here
==

solution==#|py|
from typing import List

def sum_of_positive(l : List[int]) -> int : 
    return sum(i for i in l if i > 0)
==

before==#|py|
from database_utils import get_session, Base, Response

blabla = f"Le numéro de l'activité est : {activity__id}\n\n" 
blabla += f"Vous êtes connecté votre numéro d'utillisateur est : {user__id}" if user__id else f"Vous êtes anonyme, votre numéro de session est : {session__id}"

last_user_response = ""
db_url = "activities-db"
db_name = "activity_db"
db_user = "activity_user"
db_password = "Dimz80k7X97!"

with get_session(table_class= Response, base=Base, db_url = db_url  , db_name =db_name , db_user =db_user, db_password =  db_password ) as session:
    if not session.query(Response).filter(Response.student_id == 0).all() : 
        session.add(Response(student_id = 0, response = "Salut ! Comment ça va?"))
        session.commit()
    last_user_response = session.query(Response).order_by(Response.id.desc()).first().response

del session
==

title==
Test BDD sandbox
==

text==
{{blabla}}
</br>
==

form==
{{editor|component}}
==

evaluator==#|py|
from database_utils import get_session, Base, Response
from sqlalchemy import Column, String, Integer



##### TEST CODE ETUDIANT ######

from typing import List
from random import sample

def solution(l : List[int]) -> int : 
    return sum(i for i in l if i > 0)

note = 100

try: 
    exec(editor.code)
    for i in range(10):
        randomList = sample(range(-500, 500), 100)
        if solution(randomList) != sum_of_positive(randomList):
            note -= 10
except SyntaxError:
    grade = (0, "Ton code contient une erreur de syntax :(")
except : 
    grade = (0, "Ton code à levé une exception ://")
finally:
    if note == 100:
        grade = (note, "Bravo ! Tu peux passer aux corrections")

    with get_session(table_class = Response, base=Base) as session:
        session.add(Response(student_id = user__id if user__id else session__id, response = editor.code))
        session.commit()
    else:
        grade = (note, "Mince il semble que ton code compile mais ne donne pas le résultat attendu ! Réessaye") 

"""
if reponse.value.lower() == "je veux tout voir!":
    feedback = ""
    with get_session(table_class = Response, base=Base) as session:
        for txt in session.query(Response).all():
            feedback += f"<p>{txt}</p>"
        session.commit()
    grade = (100, feedback)
elif reponse.value:
    grade = (100, " just do it")
    with get_session(table_class = Response, base=Base) as session:
        session.add(Response(student_id = user__id if user__id else session__id, response = reponse.value))
        session.commit()
    del Base
else:
    grade = (0, '<span class="error-state">Ton code ne donne pas la réponse attendue, reessaye !</span>')
"""
==
