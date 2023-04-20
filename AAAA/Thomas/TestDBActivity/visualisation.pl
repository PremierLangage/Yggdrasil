
title= Visualisation des évaluations

text==
Ce n'est pas un exercice à proprement parler juste une façon de visualiser les différents remarques faites sur les copies rendues.
==

before==#|py|
from database_utils import get_session, Base, Response

responses = list()

with get_session(table_class= Response, base=Base) as session:
    if user__role == "teacher":
        responses = session.query(Response).all()
    else :
        responses = session.query(Response).filter(Response.student_id == user__id).all()

display_data = list()

for response in responses:
    rep_dic = dict()
    code_editor = CodeEditor()
    code_editor.code = response.value
    code_editor.theme = "light"
    
    rep_dic["response"] = code_editor
    rep_dic["student_id"] = response.student_id
    evals_list = list()
    for evaluation in evaluations:
        eval_dic = dict()
        eval_dic["student_id"] = evaluation.student_id
        
        crit_list = list()

        for i in range(100):
            radio = evaluation.get(str(i), None)
            if not radio:
                break
            
            crit = dict()
            radio["disabled"] = True
            crit["radio"] = radio
            crit["comment"] = evaluation.get("commentaire_"+str(i), None)
            crit_list.append(crit)
        
        eval_dic["crit_list"] = crit_list or None
        evals_list.append(eval_dic)
    rep_dic["evaluations"] = evals_list
    display_data.append(rep_dic)

==

grader==

==

form==
<p>Vous êtes un {{user__role}}</p>

{% for student_response in display_data %}


    {% for evaluation in student_response["evaluations"] %}



{% endfor %} 




==






