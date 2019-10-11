@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ grc_conj.json [grc_conj.json]
@ grc_verbs.json [grc_verbs.json]

title = Grec ancien

radio =: RadioGroup

before==
radio.items=[{'id':'1S','content':'1ère personne du singulier'},
            {'id':'2S','content':'2e personne du singulier'},
            {'id':'3S','content':'3e personne du singulier'},
            {'id':'1P','content':'1ère personne du pluriel'},
            {'id':'2P','content':'2e personne du pluriel'},
            {'id':'3P','content':'3e personne du pluriel'}
            ]
import json,random

with open('grc_conj.json','r',encoding='utf8') as f:
    tplconj=json.load(f)
    
with open('grc_verbs.json','r',encoding='utf8') as f:
    dataverb=json.load(f)


name=random.choice(list(dataverb.keys()))

def render(arg,data):
    if isinstance(arg,dict):
        return {k: render(v,data) for k, v in arg.items()}
    elif isinstance(arg,str):
        return arg.format(**data)
    else:
        return arg
            
conj={}
data=dataverb[name]
if 'pres' in data:
    conj['pres']=render(tplconj['pres'],data['pres'])
if 'imperfect' in data:
    conj['imperfect']=render(tplconj['imperfect'],data['imperfect'])
    
time=random.choice(["pres","imperfect"])
person=random.choice(["1S","2S","3S","1P","2P","3P"])
formverb=conj[time]['A']['I'][person]
==

text ==
Analyser la forme verbale suivante : {{formverb}}
==

form==
{{ radio | component }}
==

evaluator==

rightwords = ['πρεσβύτερος', 'νεώτερος']
found = 0
error = 0

for e in selectable.selections:
    if e['content'] in rightwords:
        e['css'] = "success-state"
        found += 1
    else:
        e['css'] = "error-state"
        error += 1

if found == 10 and error == 0:
    score = 100
    msg = '<span class="success-state">Bravo, vous avez trouvé tous les adjectifs comparatifs !</span>'
else:
    score = max([0, 10*(found - error)])
    nb_error = (10 - found) + error
    if nb_error > 1:
        msg = '<span class="error-state">Il y a {} erreurs...</spam>'.format(nb_error)
    else:
        msg = '<span class="error-state">Il y a 1 seule erreur...</spam>'

grade = (score, msg)
==



