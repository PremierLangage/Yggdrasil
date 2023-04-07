@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

@databas_utils.py 

reponse =: Input
reponse.placeholder = Ta réponse
reponse.appearance = outline

numEtudiant =: Input
numEtudiant.type = number
numEtudiant.placeholder = Numéro Étudiant
numEtudiant.maxlength = 6
numEtudiant.appearance = outline

before==
from databas_utils import get_session
from sqlalchemy.orm import declarative_base

class Response(declarative_base()):
    __tablename__ = "test_db_student_1" 
    id = Column("id", Integer, primary_key=True)
    student_id = Column("student_id", Integer)
    response = Column("response", String)

    def __repr__(self):
          return f"{self.student_id} à répondu : {self.response}"

if not session.query(Response).filter(Response.student_id == 0).all() : 
    session.add(Response(student_id = 0, response = "Salut ! Comment ça va?"))
    session.commit()

last_user_response = session.query(Response).order_by(Response.id.desc()).first().response
==

title==
Test BDD sandbox
==

text==
Le dernier étudiant à dit : {{last_user_response}}
==

form==
{{ reponse|component}}
==

evaluator==
if r == reponse.value:
    grade = (100, '<span class="success-state">Good 👏👏👏</span>')
else:
    grade = (0, '<span class="error-state">Bad answer 👎👎👎</span>')
==
