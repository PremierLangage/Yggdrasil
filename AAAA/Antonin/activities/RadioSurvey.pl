extends = /AAAA/Antonin/stats.pl

# Ecrire un titre ici
title= Test title

before==#|python|
QUESTIONS = [v for q, v in globals().items() if q.startswith("question_")]
NUMBER_QUESTIONS = len(QUESTIONS)

radio = []
for i in range(len(QUESTIONS)):
    tmp = RadioGroup(cid=str(i))
    tmp.question = QUESTIONS[i]
    tmp.items = []
    for j, item in enumerate(items.splitlines()):        
        tmp.items.append({ "id": j+1, "content": item })
    globals()[str(i)] = tmp
    radio.append(vars(tmp))

if user__role == "teacher":
    data = {v:{} for v in range(NUMBER_QUESTIONS)}
    answers_csv = f"username,firsname,lastname,email,{','.join(QUESTIONS)}\\n"
    with get_session(table_class= Response, base=Base) as session:
        answers = session.query(Response.value).all()
 
    for answer in answers:
        for k, v in json.loads(str(answer[0])).items():
            data[v][k] = data[v].get(k, 0) + 1
    globals()["data"] = data
==

formstudent==#|html|
{% if False and HAS_ANSWERED != None %}
        <span class="success-state">Vous avez déjà répondu à ce sondage</span>
    {% else %}
        {% for r in radio %}
            {{ r.question|safe }}

            {{ r|component }}

        {% endfor %}
{% endif %}
==