

def format_feedback_lightscore(score,feedback):
    if score==-1:
        tpl="""<div class="alert {}"><strong>{}</strong> <br> {}</div>"""
        return tpl.format('alert-info',score, feedback)
    tpl="""<div class="alert alert-secondary"><strong>Score : {} / 100 <br> </strong> {}</div>"""
    return tpl.format(score,feedback)

def component(l):
    if isinstance(l,dict):
        selector = l["selector"]
        cid = l["cid"]
    else:
        selector = l.selector
        cid = l.cid
    return "<%s cid='%s'></%s>" % (selector, cid, selector)


def addFilter():
    from jinja2 import Environment, BaseLoader
    env = Environment(loader=BaseLoader())
    env.globals.update({
        "component":    component
    })
    env.filters["component"] = component
    return env



from components import Component
from radio import Radio
from checkbox import Checkbox
from textselect import TextSelect
radio = Radio() 
check = Checkbox()
ztext =TextSelect()







def evaluate(q):
    if q['type'] == "Radio":
        return radio.eval()
    if q['type'] == "Checkbox":
        return check.eval()
    if  q['type'] == 'TextSelect':
        return ztext.eval()

def strfromcomp(q):
    if q['type'] == "Radio":
        return "{{ curcomp | component }}"
    if q['type'] == "Checkbox":
        return "{{ check | component }}"
    if  q['type'] == 'TextSelect':
        return "{{ ztext | component }}"


currentscore=0
if step> -1:

    # Evaluation de la réponse et stockage pour la suite 

    previous = Component.deseralize(list_questions[step])

    scores.append(previous.eval())
    fifi = previous.formstr()
    q=list_questions[step]
    score = evaluate(q)
    scores.append(score)
    fifi = text + " \n " + strfromcomp(q)
    feedbacks += str(env.from_string(fifi).render(globals()))
    currentscore=sum(scores)//nbstep

step = step+1



if step<nbstep:
    q=list_questions[step]
    curcomp=  Component.deserialize(q['type'],q)
    if debug:
        print(curcomp)
    quit()
    title = "Question "+str(step)
    if q['type'] == "Radio":
        curcomp = CustomRadio() 
        curcomp.setitems(q['items'])
        curcomp.setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            curcomp.shuffle()
    elif q['type'] == "Checkbox":
        curcomp=CustomCheckbox()
        curcomp.setitems(q['items'])
        curcomp.setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            curcomp.shuffle()
    elif  q['type'] == 'TextSelect':
        curcomp.setdata_from_textDR(q['items'][0])
    statement = curcomp.text
    grade=(currentscore, "<br>")
    text="""Question {{ step + 1 }}.
    {{ statement | safe }}"""
    form="{{ curcomp | component }}"
else: # Fin de l'exo 
    text  = format_feedback_lightscore(currentscore, "") + feedbacks
    form= ""
    grade=(currentscore, "Merci et à Bientot.")



