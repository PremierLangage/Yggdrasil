@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ grc_conj.json [grc_conj.json]
@ grc_verbs.json [grc_verbs.json]

title = Grec ancien


radio_prs =: RadioGroup
radio_time =: RadioGroup

before==
radio_prs.items=[{'id':'1S','content':'1ère personne du singulier'},
            {'id':'2S','content':'2e personne du singulier'},
            {'id':'3S','content':'3e personne du singulier'},
            {'id':'1P','content':'1ère personne du pluriel'},
            {'id':'2P','content':'2e personne du pluriel'},
            {'id':'3P','content':'3e personne du pluriel'}
            ]
radio_time.items=[{'id':'pres','content':'présent'},
            {'id':'imperfect','content':'imparfait'},
            {'id':'aorist','content':'aoriste'},
            {'id':'perfect','content':'parfait'}
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
<table>
  <tr>
    <td> {{ radio_prs | component }} </td>
    <td> {{ radio_time | component }} </td>
  </tr>
</table>
==

evaluator==
S = radio_prs.selection
score = 0
feedback = 'Bad answer'

for item in radio_prs.items:
    if item['id'] == S:
        if S == person:
            item['css'] = 'success-state'
            score = 100
        else:
            item['css'] = 'error-state'
    elif item['id'] == person:
        item['css'] = 'success-state'

S = radio_time.selection
score = 0
feedback = 'Bad answer'

for item in radio_time.items:
    if item['id'] == S:
        if S == time:
            item['css'] = 'success-state'
            score = 100
        else:
            item['css'] = 'error-state'
    elif item['id'] == time:
        item['css'] = 'success-state'

grade = (score, feedback)
==



