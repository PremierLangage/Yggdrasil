@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/bbefore.py

@database_utils.py 

reponse =: Input
reponse.placeholder = Ta réponse
reponse.appearance = outline

before==
from database_utils import get_session
from sqlalchemy import Column, String, Integer
from sqlalchemy.orm import declarative_base

Base = declarative_base()

class Response(Base):
    __tablename__ = "test_db_student_1" 
    id = Column("id", Integer, primary_key=True)
    student_id = Column("student_id", Integer)
    response = Column("response", String)

    def __repr__(self):
          return f"{self.student_id} à répondu : {self.response}"

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
del Base
==

title==
Test BDD sandbox
==

text==
{{blabla}}
</br>
</br>
Le dernier étudiant à dit : {{last_user_response}}
==

form==
{{ reponse|component}}
==

evaluator==
from database_utils import get_session
from sqlalchemy.orm import declarative_base
from sqlalchemy import Column, String, Integer

Base = declarative_base()
class Response(Base):
    __tablename__ = "test_db_student_1" 
    id = Column("id", Integer, primary_key=True)
    student_id = Column("student_id", Integer)
    response = Column("response", String)

    def __repr__(self):
        return f"{self.student_id} à répondu : {self.response}"


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
    grade = (0, '<span class="error-state">Je ne peux pas valider ça problem numéro étudiant ou réponse </span>')
==
