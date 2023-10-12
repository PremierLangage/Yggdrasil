
extends= /exemples/matchlistcsv/matchlistcsv.pl

@ engflac.csv [content.csv]


title= Associer mot et prononciation


before==
import random
from mkl import fromcsv,selectionfromcsv

match.nodes , expected =  selectionfromcsv("content.csv")
random.shuffle(match.nodes)

for item in match.nodes:
    if 'source' in item :
        content=item['content']
        item['content']=f'<audio controls><source src="http://monge.univ-mlv.fr/~dr/flac/{content}"></audio>'

==

