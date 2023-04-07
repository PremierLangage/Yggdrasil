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
class Responses(Base):
    __tablename__ = "test_db_student_1" 
    id = Column("id", Integer, primary_key=True)
    student_id = Column("student_id", Integer)
    response = Column("response", String)

    def __repr__(self):
          return f"{self.student_id} à répondu : {self.response}"



if session.query(Responses).filter(Responses.student_id == 0).all


last_user_response = 

==

title==
Input Component
==

text==
Enter the result of ** {{ a }} + {{ b }} ** inside the input box.
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
