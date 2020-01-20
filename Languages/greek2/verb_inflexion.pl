extends = /template/basic.pl
@ grc_conj.json [grc_conj.json]
@ grc_verbs.json [grc_verbs.json]

title = Grec ancien : Analyse verbale

settings.feedback.class = colorbox

radio_prs =: RadioGroup
radio_tense =: RadioGroup
radio_mood =: RadioGroup
radio_voice =: RadioGroup

extracss ==
<style>
.myclass {
    padding: 4px 4px 4px 4px !important;
}
</style>
==

before==
content_prs={'1S':'1ère personne du singulier','2S':'2e personne du singulier','3S':'3e personne du singulier','1P':'1ère personne du pluriel','2P':'2e personne du pluriel','3P':'3e personne du pluriel'}
content_tense={'pres':'présent','imperfect':'imparfait','future':'futur','aorist':'aoriste'}

lst_prs = [{'id':'1S','content':'1ère pers. du singulier'},
            {'id':'2S','content':'2e pers. du singulier'},
            {'id':'3S','content':'3e pers. du singulier'},
            {'id':'1P','content':'1ère pers. du pluriel'},
            {'id':'2P','content':'2e pers. du pluriel'},
            {'id':'3P','content':'3e pers. du pluriel'}
            ]

lst_tense = [{'id':'pres','content':'présent'},
              {'id':'imperfect','content':'imparfait'},
              {'id':'future','content':'futur'},
              {'id':'aorist','content':'aoriste'}
            ]

lst_voice = [{'id':'A','content':'actif'},
            {'id':'M','content':'moyen'}
            {'id':'P','content':'passif'}
            ]

lst_mood = [{'id':'I','content':'indicatif'},
            {'id':'S','content':'subjonctif'},
            {'id':'O','content':'optatif'}
            ]

radio_prs.items = lst_prs
radio_tense.items = lst_tense
radio_voice.items = lst_voice
radio_mood.items = lst_mood

lst_radio = [radio_prs,radio_tense,radio_voice,radio_mood]
for radio in lst_radio:
    for item in radio.items:
        item['css']='myclass'

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
if 'future' in data:
    conj['future']=render(tplconj['future'],data['future'])
if 'aorist' in data:
    conj['aorist']=render(tplconj['aorist'],data['aorist'])

voice=random.choice(["A","MP"])
mood=random.choice(["I"])
tense=random.choice(["pres","imperfect","future","aorist"])
person=random.choice(["1S","2S","3S","1P","2P","3P"])

formverb=conj[tense][voice]['I'][person]
if isinstance(formverb,list):
    formverb=random.choice(formverb)
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
score=0
try:
    ans=conj[radio_tense.selection][radio_voice.selection][radio_mood.selection][radio_prs.selection]
except:
    ans=""
if isinstance(ans,str):
    if ans==formverb:
        score=100
if isinstance(ans,list):
    if formverb in ans:
        score=100

feedback=""
grade = (score,feedback)
lst_radio = [radio_prs,radio_tense,radio_voice,radio_mood]
for radio in lst_radio:
    radio.disabled=True
==


