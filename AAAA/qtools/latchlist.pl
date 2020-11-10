
extends= /exemples/matchlistcsv/matchlistcsv.pl

@ engflac.csv [content.csv]


before==
import random
from mkl import fromcsv,selectionfromcsv

match.nodes , expected =  selectionfromcsv("content.csv")
random.shuffle(match.nodes)

text+=str(match.nodes)

==
