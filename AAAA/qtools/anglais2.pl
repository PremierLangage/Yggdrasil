

extends= /exemples/checkboxgroupcsv/model.pl

title= Reconnaitre un mot 

@ flaceng.csv [content.csv] 

text==
Indiquez le mot  

    {{solutionvalue}}

==


before==
import random,readcsv, mkl

group.items,solution, debug = readcsv.getrandomselection(sourcecol="target",targetcol="source")

for item in group.items:
    content = item['content']
    item['content']=f'<audio controls><source src="http://monge.univ-mlv.fr/~dr/flac/{content}"></audio>'

solutionvalue =random.choice(solution)

for i, it in enumerate(group.items):
    it['index'] = i
indexs = [ i for i,x in enumerate(solution) if x==solutionvalue ]

==

