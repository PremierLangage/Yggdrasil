
# Ecrire un titre ici
title= Test title

bbefore==#|python|
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

==

extends = /AAAA/Antonin/stats.pl
