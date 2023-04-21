
@ /builder/before.py [builder.py]
@ /utils/sandboxio.py
@database_utils.py


title= Visualisation des évaluations

text==
Ce n'est pas un exercice à proprement parler juste une façon de visualiser les différents remarques faites sur les copies rendues.
==

group =: RadioGroup


before==#|py|
#########################################################################
import random
import uuid

A = random.randint(0, 10)
B = random.randint(0, 10)
R = uuid.uuid4()

# append random false answers to group.items array.
group.items = []
for i in range(4):
    n = random.randint(0, 100)
    while n == A * B:
        n = random.randint(0, 100)
    group.items.append({
        "id": uuid.uuid4(), # generate a random id instead of an hardcoded to avoid cheat
        "content": str(n)
    })

# append random right answer to group.items array.
group.items.append({
    "id": R,
    "content": str(A * B)
})
#########################################################################

from database_utils import get_session, Base, Response
import sys
import uuid

responses = list()
display_data = list()
aaaaa = ""
bbbbb = ""

with get_session(table_class= Response, base=Base) as session:
    if user__role == "teacher":
        responses = session.query(Response).all()
    else :
        responses = session.query(Response).filter(Response.student_id == user__id).all()

    for response in responses:
        rep_dic = dict()
        code_editor = CodeEditor(cid = str(uuid.uuid4()))
        code_editor.code = str(response.value)
        code_editor.theme = "light"

        rep_dic["response"] = vars(code_editor)
        rep_dic["student_id"] = response.student_id
        evals_list = list()
        for evaluation in response.evaluations:
            eval_dic = dict()
            eval_dic["student_id"] = evaluation.student_id
            
            crit_list = list()
            evaluation = eval(evaluation.eval)

            for i in range(100):
                radio = evaluation.get(str(i), None)
                if not radio:
                    break

                radio["cid"] = str(uuid.uuid4())
                globals()[radio["cid"]] = radio
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
<pre>
<code class="language-python">
def fun():
    return "coucou";
</code>
</pre>


<p>Vous êtes un {{user__role}}</p>

{% for student_response in display_data %}
    <p>Reponse de l'élève : {{ student_response["student_id"] }}</p>
    {{ student_response["response"]|component }}
    <pre>
    <code class="language-python">
{{student_response["response"].code}}
    </code>
    </pre>
    {% for evaluation in student_response["evaluations"] %}
        <p> Évaluation faite par l'élève : {{evaluation["student_id"]}} </p>
        {% for crit in evaluation["crit_list"] %}
            <p> Ceci est un critère : <p></br>
            {{ crit["radio"]|component }}
            {% if crit["comment"] != None %}
            <textarea name="justificatif" cols=30% rows="2" readonly=true>{{ crit["comment"] }}</textarea>
            {% endif %}
        {% endfor %}
    {% endfor %}
{% endfor %} 






==






