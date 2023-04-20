







title= Visualisation des évaluations

text==
==

before==#|py|
from database_utils import get_session, Base, Response


with get_session(table_class= Response, base=Base) as session:
    if session.query(Response).filter(Response.student_id == user__id).first() : 
        form = ''
        text = 'Vous avez déjà soumis une réponse. Veuillez passer à la partie évaluation.'

del session
==

form==

==






