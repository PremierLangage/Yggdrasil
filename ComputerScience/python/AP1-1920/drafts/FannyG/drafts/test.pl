
@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]

title = Radio group
text  = Quelle est la capitale ?
form  = {{ radio|component }}
radio =: RadioGroup

before == #|python|
radio.items = [{"id": "1", "content": "ok"},{"id": "2", "content": "ol"},{"id": "3", "content": "om"}]
==



evaluator == #|python|
selectedId = radio.selection

for index, item in enumerate(radio.items):
    item['css'] = ''
    choice = choices[index]

    if choice['right']: # the good anwser
        if choice['id'] == selectedId : # student anwsered correctly 
            score = 100
            item['css'] = "success-border"
        else:
            item['css'] = 'success-border anim-pulse'
    else:
         if choice['id'] == selectedId :
            item['css'] = "error-border"
    if choice['id'] == selectedId and choice['feedback']:
                feedback =  choice["feedback"] + "<br/>"


==




