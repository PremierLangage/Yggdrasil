
@ /builder/before.py [builder.py]
@ /utils/sandboxio.py
@database_utils.py


title= Visualisation des évaluations

text==
Ce n'est pas un exercice à proprement parler juste une façon de visualiser les différents remarques faites sur les copies rendues.
==

before==#|py|
from database_utils import get_session, Base, Response
import sys
import uuid

normalCodeEditor = CodeEditor(cid = "codeAnswer")
normalCodeEditor.theme = "light"
normalCodeEditor.code = "import python\n..."
responses = list()
display_data = list()
aaaaa = ""

with get_session(table_class= Response, base=Base) as session:
    if user__role == "teacher":
        responses = [session.query(Response).first()]
    else :
        responses = session.query(Response).filter(Response.student_id == user__id).all()

    for response in responses:
        rep_dic = dict()
        code_editor = CodeEditor(cid = uuid.uuid4())
        code_editor.code = str(response.value)
        aaaaa = str(response.value)
        code_editor.theme = "light"
        code_editor.debug = True

        rep_dic["response"] = vars(code_editor)
        rep_dic["student_id"] = response.student_id
        evals_list = list()
        for evaluation in response.evaluations:
            eval_dic = dict()
            eval_dic["student_id"] = evaluation.student_id
            print("BBBBBBBBBB", file=sys.stderr)
            
            crit_list = list()
            evaluation = eval(evaluation.eval)

            print("AHHHHHH", file=sys.stderr)

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

aa = list(map(str, range(20)))

==

grader==

==

form==
<p>Vous êtes un {{user__role}}</p>
{{aaaaa}}

{% for student_response in display_data %}
    <p>Reponse de l'élève : {{ student_response["student_id"] }}</p>
    {{ student_response["response"]|component }}
    {{ student_response["response"] }}
    normal one : 
    {{  }}

    {% for evaluation in student_response["evaluations"] %}
        <p> Évaluation faite par l'élève : {{evaluation["student_id"]}} </p>
        {% for crit in evaluation["crit_list"] %}
            {{ evaluation["radio"]|component }}
            {% if evaluation["comment"] != None %}
            <textarea name="justificatif" cols=30% rows="2" readonly=true>{{ evaluation["comment"] }}</textarea>
            {% endif %}
        {% endfor %}
    {% endfor %}
{% endfor %} 






==






