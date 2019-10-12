@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ grc_conj.json [grc_conj.json]
@ grc_verbs.json [grc_verbs.json]
@ /utils/components.py [utilscomponents.py]

title = Grec ancien


radio_prs =: RadioGroup
radio_tense =: RadioGroup
radio_mood =: RadioGroup
radio_voice =: RadioGroup

before==
radio_prs.items=[{'id':'1S','content':'1ère personne du singulier'},
            {'id':'2S','content':'2e personne du singulier'},
            {'id':'3S','content':'3e personne du singulier'},
            {'id':'1P','content':'1ère personne du pluriel'},
            {'id':'2P','content':'2e personne du pluriel'},
            {'id':'3P','content':'3e personne du pluriel'}
            ]
radio_tense.items=[{'id':'pres','content':'présent'},
            {'id':'imperfect','content':'imparfait'},
            {'id':'aorist','content':'aoriste'},
            {'id':'perfect','content':'parfait'}
            ]
radio_voice.items=[{'id':'A','content':'actif'},
            {'id':'M','content':'moyen'},
            {'id':'P','content':'passif'}
            ]
radio_mood.items=[{'id':'I','content':'indicatif'},
            {'id':'S','content':'subjonctif'},
            {'id':'O','content':'optatif'}
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

voice=random.choice(["A","M","P"])
mood=random.choice(["I"])
tense=random.choice(["pres","imperfect","future"])
person=random.choice(["1S","2S","3S","1P","2P","3P"])
if (voice=="M" or voice=="P") and (tense=="pres" or tense=="imperfect"):
    voice2="MP"
elif:
    voice2=voice
formverb=conj[tense][voice2]['I'][person]
==

text ==
<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
Analyser la forme verbale suivante : 
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{formverb}}
</div><br>
==

form==
<table>
  <tr style='vertical-align: top'>
    <td style="padding-right:1em;"> {{ radio_prs | component }} </td>
    <td style="padding-right:1em;"> {{ radio_tense | component }} </td>
    <td style="padding-right:1em;"> {{ radio_voice | component }} </td>
    <td> {{ radio_mood | component }} </td>
  </tr>
</table>
==

evaluator==
from utilscomponents import checkradio

score,_=checkradio(radio_prs,person)
score,_=checkradio(radio_tense,tense)
score,_=checkradio(radio_voice,voice)
score,_=checkradio(radio_mood,mood)
score=100

feedback="Vous avez répondu %s %s %s %s" % (radio_prs.selection,radio_tense.selection,radio_voice.selection,radio_mood.selection)
grade = (score,feedback)
==



