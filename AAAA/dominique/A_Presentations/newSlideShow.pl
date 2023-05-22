


@ /utils/sandboxio.py
@ /builder/bbefore.py [builder.py]
@ /grader/evaluator.py [grader.py]

text=
form=

@ lot1.md [slides.md]





title=Des slides pour vous  

beforeA==
#import markdown 
#md = markdown.Markdown()


with open ("slides.md" , "r") as f:
    t=f.readlines()

slides=("\n".join(t)).split("\n***\n")
numero=0


if numero<len(slides):
    text=  slides[0] +"<br/> <br/> <br/>"
    title= ''



==

XeforeB==

def getfirstnomblancklineandcut(s):
    global text
    r=""

    l=s.split("\n")
    for i,line in enumerate(l):
        text += "--" + line + "-- \n"
        if line == "" :
            continue
        return (l[i],"\n".join(l[i+1:]))
    return ("","")

with open ("slides.md" , "r") as f:
    t=f.readlines()

slides=("\n".join(t)).split("\n***\n")
numero=0

docslides=[]
for s in slides:
    docslides.append(getfirstnomblancklineandcut(s))

slides=docslides
if numero<len(slides):
    text=slides[numero][1]+ f"   \n <p style='text-align:right;'>Slide {numero}</p> \n"
    title= slides[numero][0].strip("#") 


==

before=

evaluatorX==

numero += 1
for e in selectable.selections:
    e['css'] = "error-state"
    if e['index'] is 0 :
        numero -= 2
        if numero <0:
            numero = 0
    if e['index'] is 1 : # restart
        numero = 0
    if  e['index'] is 2 : # End
        numero = len(slides)
if numero<len(slides):
    text=slides[numero][1]+ f"   \n <p style='text-align:right;'>Slide {numero}</p> \n"
    title= slides[numero][0].strip("#") 
    grade=(0,"continuez")
else:
    grade=(100,"Bonne continuation")
==

# Version avec markdown
evaluator==

numero += 1
for e in selectable.selections:
    e['css'] = "error-state"
    if e['index'] is 0 :
        numero -= 2
        if numero <0:
            numero = 0
    if e['index'] is 1 : # restart
        numero = 0
    if  e['index'] is 2 : # End
        numero = len(slides)
if numero<len(slides):
    text=slides[numero]+"<br/> <br/> <br/>"
    title= ''
    grade=(0,"")
else:
    text="""<h1> Vos questions </h1>
    <img src="https://media.istockphoto.com/id/943657262/fr/photo/point-dinterrogation-bleu-3d-point-dinterrogation-marque-de-ponctuation-demandant-signe-de.jpg?s=612x612&w=0&k=20&c=4A0md9LtHeQGooXTc0OXqmCddKvT4xg3xn1RzJpSEwY=" >
    """
    title= ''
    grade=(100,'')
==





selectable =: Text
selectable.text = Back Restart end
selectable.mode = word

beforeB==
selectable.separator = ' '
==




form==
{{ selectable|component}}
==

